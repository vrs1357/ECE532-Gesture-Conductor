--jn----------------------------------------------------------------------------------
--jn-- Company: Digilent Ro
--jn-- Engineer: Elod Gyorgy
--jn-- 
--jn-- Create Date:    14:55:31 04/07/2011 
--jn-- Design Name: 
--jn-- Module Name:    TWIUtils - Package 
--jn-- Project Name:	 TWI Master Controller Reference Design 
--jn-- Target Devices: 
--jn-- Tool versions: 
--jn-- Description: This package provides enumeration types for TWI (Two-Wire
--jn-- Interface) bus status and error conditions.
--jn--
--jn-- Dependencies: 
--jn--
--jn-- Revision: 
--jn-- Revision 0.01 - File Created
--jn-- Additional Comments: 
--jn--
--jn----------------------------------------------------------------------------------
--jnpackage TWIUtils is
--jn  type busState_type is (busUnknown, busBusy, busFree);
--jn  type error_type is (errArb, errNAck);
--jnend TWIUtils;
--jn
--jnpackage body TWIUtils is 
--jnend TWIUtils;
--jn
--jn----------------------------------------------------------------------------------
--jn-- Company: Digilent Ro
--jn-- Engineer: Elod Gyorgy
--jn-- 
--jn-- Create Date:    14:55:31 04/07/2011 
--jn-- Design Name: 
--jn-- Module Name:    TWICtl - Behavioral 
--jn-- Project Name:	 TWI Master Controller Reference Design 
--jn-- Target Devices: 
--jn-- Tool versions: 
--jn-- Description: TWICtl is a reusabled Master Controller implementation of the
--jn-- TWI protocol. It uses 7-bit addressing and was tested in STANDARD I2C mode.
--jn-- FAST mode should also be theoretically possible, although it has not been
--jn-- tested. It adheres to arbitration rules, thus supporting multi-master TWI
--jn-- buses. Slave-wait is also supported.
--jn-- 
--jn--
--jn-- Dependencies: digilent.TWIUtils package	- TWICtl.vhd
--jn--
--jn-- Revision: 
--jn-- Revision 0.01 - File Created
--jn-- Additional Comments: 
--jn--
--jn----------------------------------------------------------------------------------
--jnlibrary IEEE;
--jnuse IEEE.STD_LOGIC_1164.ALL;
--jnuse IEEE.STD_LOGIC_ARITH.ALL;
--jnuse IEEE.STD_LOGIC_UNSIGNED.ALL;
--jnuse IEEE.math_real.all;
--jn
--jnlibrary digilent;
--jn--use digilent.TWIUtils.ALL;
--jn
--jnentity TWICtl is
--jn----------------------------------------------------------------------------------
--jn-- Title : Mode of operation
--jn-- Description: The controller can be instructed to initiate/continue/stop a 
--jn-- data transfer using the strobe (STB_I, MSG_I) signals. Data flow management is 
--jn-- provided by the done (DONE_O) and error (ERR_O, ERRTYPE_O) signals. Output
--jn-- signals are synchronous to CLK and input signals must also be synchronous to
--jn-- CLK. Signals are active-high.
--jn-- Fast-track instructions (single byte transfer):
--jn--		-put the TWI address on A_I
--jn--		-if data is written put it on D_I
--jn--		-assert STB_I
--jn--		-when DONE_O pulse arrives, read data is present on D_O, if any
--jn--		-repeat, or deassert STB_I
--jn-- Detailed data transfer flow:
--jn--    -when DONE_O is low, the controller is ready to accept commands
--jn--    -data transfer can be initiated by putting a TWI slave address on the A_I
--jn--    bus and providing a strobe (STB_I)
--jn--    -the direction of data transfer (read/write) is determined by the LSB of the
--jn--    address (0-write, 1-read)
--jn--		-in case of a 'write' the data byte should also be present on the D_I bus
--jn--		prior to the arrival of the strobe (STB_I)
--jn--    -once the data byte gets read/written, DONE_I pulses high for one CLK cycle
--jn--		-in case of an error, ERR_O will pulse high together with DONE_I; ERR_O low
--jn--		together with DONE_I high indicates success
--jn--		-after DONE_I pulses high there is a 1/4 TWI period time frame when the next
--jn--		strobe can be sent; this is useful, when multiple bytes are sent/received
--jn--		in a single transfer packet; for ex. for write transfers, a new byte can
--jn-- 	be put on the D_I and STB_I provided;
--jn--		-if no new strobe is provided, the transfer will end
--jn--		-if a new strobe is provided, but the address changed, the current transfer
--jn--		will end and a new will begin
--jn--		-starting a new transfer can be forced with the MSG_I pin; if asserted with
--jn--		a strobe, the data byte will be written/read in a new packet; the advantage
--jn--		of this is relevant only in multi-master buses: rather than waiting for the
--jn--		current transfer to end and the bus to be released, a new transfer can be
--jn--		initiated without giving up the control over the bus
--jn----------------------------------------------------------------------------------
--jn	generic (CLOCKFREQ : natural := 50); -- input CLK frequency in MHz
--jn	port (
--jn		MSG_I : in STD_LOGIC; --new message
--jn		STB_I : in STD_LOGIC; --strobe
--jn		A_I : in  STD_LOGIC_VECTOR (7 downto 0); --address input bus
--jn		D_I : in  STD_LOGIC_VECTOR (7 downto 0); --data input bus
--jn		D_O : out  STD_LOGIC_VECTOR (7 downto 0); --data output bus
--jn		DONE_O : out  STD_LOGIC; --done status signal
--jn      ERR_O : out  STD_LOGIC; --error status
--jn		CLK : in std_logic;
--jn		SRST : in std_logic;
--jn----------------------------------------------------------------------------------
--jn-- TWI bus signals
--jn----------------------------------------------------------------------------------
--jn		SDA : inout std_logic; --TWI SDA
--jn		SCL : inout std_logic --TWI SCL
--jn	);
--jnend TWICtl;
--jn
--jnarchitecture Behavioral of TWICtl is
--jn	attribute fsm_encoding: string;
--jn	
--jn	constant FSCL : natural := 400_000; --in Hz SCL clock frequency
--jn	constant TIMEOUT : natural := 10; --in ms TWI timeout for slave wait period
--jn	constant TSCL_CYCLES : natural := 
--jn		natural(ceil(real(CLOCKFREQ*1_000_000/FSCL)));
--jn	constant TIMEOUT_CYCLES : natural :=
--jn		natural(ceil(real(CLOCKFREQ*TIMEOUT*1_000)));
--jn
--jn   type state_type is (stIdle, stStart, stRead, stWrite, stError, stStop,
--jn		stSAck, stMAck, stMNAckStop, stMNAckStart, stStopError); 
--jn    type busState_type is (busUnknown, busFree, busBusy);
--jn    type error_type is (errNAck, errArb);
--jn   signal state, nstate : state_type;
--jn	attribute fsm_encoding of state: signal is "gray";	
--jn		
--jn	signal dSda, ddSda, dScl, ddScl : std_logic;
--jn	signal fStart, fStop : std_logic;
--jn	signal busState : busState_type := busUnknown;
--jn	signal errTypeR, errType : error_type;
--jn   signal busFreeCnt, sclCnt : natural range TSCL_CYCLES downto 0 := TSCL_CYCLES;
--jn	signal timeOutCnt : natural range TIMEOUT_CYCLES downto 0 := TIMEOUT_CYCLES;
--jn	signal slaveWait, arbLost : std_logic;
--jn	signal dataByte, loadByte, currAddr : std_logic_vector(7 downto 0); --shift register and parallel load
--jn	signal rSda, rScl : std_logic := '1';
--jn	signal subState : std_logic_vector(1 downto 0) := "00";
--jn	signal latchData, latchAddr, iDone, iErr, iSda, iScl, shiftBit, dataBitOut, rwBit, addrNData : std_logic;
--jn	signal bitCount : natural range 0 to 7 := 7;
--jn	signal int_Rst : std_logic := '0';
--jnbegin
--jn
--jn----------------------------------------------------------------------------------                  
--jn--Bus State detection
--jn----------------------------------------------------------------------------------
--jnSYNC_FFS: process(CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn			dSda <= SDA;
--jn			ddSda <= dSda;
--jn			dScl <= SCL;
--jn      end if;
--jn   end process;
--jn	
--jn	fStart <= dSCL and not dSda and ddSda; --if SCL high while SDA falling, start condition
--jn	fStop <= dSCL and dSda and not ddSda; --if SCL high while SDA rising, stop condition
--jn
--jnTWISTATE: process(CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn			if (int_Rst = '1') then
--jn				busState <= busUnknown;
--jn         elsif (fStart = '1') then --If START condition detected, bus is busy
--jn            busState <= busBusy;
--jn			elsif (busFreeCnt = 0) then --We counted down tBUF, so it must be free
--jn            busState <= busFree;
--jn         end if;
--jn      end if;
--jn   end process;
--jn
--jnTBUF_CNT: process(CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn         if (dSCL = '0' or dSDA = '0' or int_Rst = '1') then
--jn            busFreeCnt <= TSCL_CYCLES;
--jn         elsif (dSCL = '1' and dSDA = '1') then
--jn            busFreeCnt <= busFreeCnt - 1; --counting down 1 SCL period on free bus
--jn         end if;
--jn      end if;
--jn   end process;
--jn	
--jn----------------------------------------------------------------------------------
--jn--Slave devices can insert wait states by keeping SCL low
--jn---------------------------------------------------------------------------------- 
--jn   slaveWait <=   '1' when (dSCL = '0' and rScl = '1') else
--jn                  '0';
--jn----------------------------------------------------------------------------------                  
--jn--If the SDA line does not correspond to the transmitted data while the SCL line
--jn--is at the HIGH level the master lost an arbitration to another master.
--jn---------------------------------------------------------------------------------- 
--jn   arbLost <=     '1' when (dSCL = '1' and dSDA = '0' and rSda = '1') else
--jn                  '0';
--jn
--jn----------------------------------------------------------------------------------
--jn-- Internal reset signal
--jn----------------------------------------------------------------------------------	
--jn   RST_PROC: process (CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn         if (state = stIdle and SRST = '0') then
--jn            int_Rst <= '0';
--jn         elsif (SRST = '1') then
--jn            int_Rst <= '1';
--jn         end if;
--jn      end if;
--jn   end process;
--jn	
--jn----------------------------------------------------------------------------------
--jn-- SCL period counter
--jn---------------------------------------------------------------------------------- 
--jnSCL_CNT: process (CLK)
--jn	begin
--jn		if Rising_Edge(CLK) then
--jn			if (sclCnt = 0 or state = stIdle) then
--jn				sclCnt <= TSCL_CYCLES/4;
--jn			elsif (slaveWait = '0') then -- clock synchronization with other masters
--jn				sclCnt <= sclCnt - 1;
--jn			end if;
--jn		end if;
--jn	end process;
--jn
--jn----------------------------------------------------------------------------------
--jn-- SCL period counter
--jn---------------------------------------------------------------------------------- 
--jnTIMEOUT_CNT: process (CLK)
--jn	begin
--jn		if Rising_Edge(CLK) then
--jn			if (timeOutCnt = 0 or slaveWait = '0') then
--jn				timeOutCnt <= TIMEOUT_CYCLES;
--jn			elsif (slaveWait = '1') then -- count timeout on wait period inserted by slave
--jn				timeOutCnt <= timeOutCnt - 1;
--jn			end if;
--jn		end if;
--jn	end process;
--jn	
--jn----------------------------------------------------------------------------------
--jn-- Title: Data byte shift register
--jn-- Description: Stores the byte to be written or the byte read depending on the
--jn-- transfer direction.
--jn----------------------------------------------------------------------------------	
--jnDATABYTE_SHREG: process (CLK) 
--jn	begin
--jn		if Rising_Edge(CLK) then
--jn			if ((latchData = '1' or latchAddr = '1') and sclCnt = 0) then
--jn				dataByte <= loadByte; --latch address/data
--jn				bitCount <= 7;
--jn				--set flag so that we now what is the byte we are sending
--jn				if (latchData = '1') then
--jn					addrNData <= '0';
--jn				else
--jn					addrNData <= '1';
--jn				end if;
--jn			elsif (shiftBit = '1' and sclCnt = 0) then
--jn				dataByte <= dataByte(dataByte'high-1 downto 0) & dSDA;
--jn				bitCount <= bitCount - 1;
--jn			end if;
--jn		end if;
--jn	end process;
--jn
--jn	loadByte <= A_I when latchAddr = '1' else
--jn					D_I;
--jn	dataBitOut <= dataByte(dataByte'high);
--jn	
--jn	D_O <= dataByte;
--jn
--jn----------------------------------------------------------------------------------
--jn-- Title: Current address register
--jn-- Description: Stores the TWI slave address
--jn----------------------------------------------------------------------------------	
--jnCURRADDR_REG: process (CLK) 
--jn	begin
--jn		if Rising_Edge(CLK) then
--jn			if (latchAddr = '1') then
--jn				currAddr <= A_I; --latch address/data
--jn			end if;
--jn		end if;
--jn	end process;
--jn	
--jn	rwBit <= currAddr(0);
--jn----------------------------------------------------------------------------------
--jn-- Title: Substate counter
--jn-- Description: Divides each state into 4, to respect the setup and hold times of
--jn-- the TWI bus.
--jn----------------------------------------------------------------------------------	
--jnSUBSTATE_CNT: process (CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn			if (state = stIdle) then
--jn				subState <= "00";
--jn			elsif (sclCnt = 0) then
--jn				subState <= subState + 1;
--jn			end if;
--jn		end if;
--jn	end process;
--jn	
--jnSYNC_PROC: process (CLK)
--jn   begin
--jn      if Rising_Edge(CLK) then
--jn         state <= nstate;
--jn			
--jn			rSda <= iSda;
--jn         rScl <= iScl;			
--jn			DONE_O <= iDone;
--jn			ERR_O <= iErr;
--jn			errTypeR <= errType;
--jn      end if;
--jn   end process;
--jn
--jnOUTPUT_DECODE: process (nstate, subState, state, errTypeR, dataByte(0),
--jn	sclCnt, bitCount, rSda, rScl, dataBitOut, arbLost, dSda, addrNData)
--jn   begin
--jn		iSda <= rSda; --no change by default
--jn		iScl <= rScl;
--jn		iDone <= '0';
--jn		iErr <= '0';
--jn		errType <= errTypeR; --keep error type
--jn		shiftBit <= '0';
--jn		latchAddr <= '0';
--jn		latchData <= '0';
--jn		
--jn		if (state = stStart) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= '1';
--jn					--keep SCL
--jn				when "01" =>
--jn					iSda <= '1';
--jn					iScl <= '1';
--jn				when "10" =>
--jn					iSda <= '0';
--jn					iScl <= '1';
--jn				when "11" =>
--jn					iSda <= '0';
--jn					iScl <= '0';
--jn				when others =>
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stStop or state = stStopError) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= '0';
--jn					--keep SCL
--jn				when "01" =>
--jn					iSda <= '0';
--jn					iScl <= '1';
--jn				when "10" =>
--jn					iSda <= '1';
--jn					iScl <= '1';
--jn				when others =>					
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stRead or state = stSAck) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= '1'; --this will be 'Z' on SDA
--jn					--keep SCL
--jn				when "01" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "10" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "11" =>
--jn					--keep SDA
--jn					iScl <= '0';
--jn				when others =>					
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stWrite) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= dataBitOut;
--jn					--keep SCL
--jn				when "01" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "10" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "11" =>
--jn					--keep SDA
--jn					iScl <= '0';
--jn				when others =>					
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stMAck) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= '0'; -- acknowledge by writing 0
--jn					--keep SCL
--jn				when "01" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "10" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "11" =>
--jn					--keep SDA
--jn					iScl <= '0';
--jn				when others =>					
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stMNAckStop or state = stMNAckStart) then
--jn			case (subState) is
--jn				when "00" =>
--jn					iSda <= '1'; -- not acknowledge by writing 1
--jn					--keep SCL
--jn				when "01" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "10" =>
--jn					--keep SDA
--jn					iScl <= '1';
--jn				when "11" =>
--jn					--keep SDA
--jn					iScl <= '0';
--jn				when others =>					
--jn			end case;
--jn		end if;
--jn		
--jn		if (state = stSAck and sclCnt = 0 and subState = "01") then
--jn			if (dSda = '1') then
--jn				iDone <= '1';
--jn				iErr <= '1'; --not acknowledged
--jn				errType <= errNAck;
--jn			elsif (addrNData = '0') then
--jn				--we are done only when the data is sent too after the address
--jn				iDone <= '1';
--jn			end if;
--jn		end if;
--jn		
--jn		if (state = stRead and subState = "01" and sclCnt = 0 and bitCount = 0) then
--jn			iDone <= '1'; --read done
--jn		end if;
--jn		
--jn		if (state = stWrite and arbLost = '1') then
--jn			iDone <= '1'; --write done
--jn			iErr <= '1'; --we lost the arbitration
--jn			errType <= errArb;
--jn		end if;
--jn		
--jn		if ((state = stWrite and sclCnt = 0 and subState = "11") or --shift at end of bit
--jn			((state = stSAck or state = stRead) and subState = "01")) then --read in middle of bit
--jn			shiftBit <= '1';
--jn		end if;
--jn		
--jn		if (state = stStart) then
--jn			latchAddr <= '1';
--jn		end if;
--jn		
--jn		if (state = stSAck and subState = "11") then --get the data byte for the next write
--jn			latchData <= '1';
--jn		end if;
--jn		
--jn	end process;
--jn	
--jnNEXT_STATE_DECODE: process (state, busState, slaveWait, arbLost, STB_I, MSG_I,
--jnSRST, subState, bitCount, int_Rst, dataByte, A_I, currAddr, rwBit, sclCnt, addrNData)
--jn   begin
--jn      
--jn      nstate <= state;  --default is to stay in current state
--jn   
--jn      case (state) is
--jn         when stIdle =>
--jn            if (STB_I = '1' and busState = busFree and SRST = '0') then
--jn               nstate <= stStart;
--jn            end if;
--jn				
--jn         when stStart =>
--jn            if (subState = "11" and sclCnt = 0) then
--jn					nstate <= stWrite;
--jn				end if;
--jn			
--jn			when stWrite =>
--jn				if (arbLost = '1') then
--jn					nstate <= stIdle;
--jn				elsif (subState = "11" and sclCnt = 0 and bitCount = 0) then
--jn					nstate <= stSAck;
--jn				end if;
--jn			
--jn			when stSAck =>
--jn				if (subState = "11" and sclCnt = 0) then
--jn					if (int_Rst = '1' or dataByte(0) = '1') then
--jn						nstate <= stStop;
--jn					else
--jn						if (addrNData = '1') then --if we have just sent the address, tx/rx the data too
--jn							if (rwBit = '1') then
--jn								nstate <= stRead;
--jn							else
--jn								nstate <= stWrite;
--jn							end if;
--jn						elsif (STB_I = '1') then
--jn							if (MSG_I = '1' or currAddr /= A_I) then
--jn								nstate <= stStart;
--jn							else
--jn								if (rwBit = '1') then
--jn									nstate <= stRead;
--jn								else
--jn									nstate <= stWrite;
--jn								end if;
--jn							end if;
--jn						else
--jn							nstate <= stStop;
--jn						end if;
--jn					end if;
--jn				end if;
--jn				
--jn         when stStop =>
--jn				if (subState = "10" and sclCnt = 0) then
--jn					nstate <= stIdle;
--jn				end if;
--jn			
--jn			when stRead =>
--jn				if (subState = "11" and sclCnt = 0 and bitCount = 7) then --bitCount will underflow
--jn					if (int_Rst = '0' and STB_I = '1') then
--jn						if (MSG_I = '1' or currAddr /= A_I) then
--jn							nstate <= stMNAckStart;
--jn						else
--jn							nstate <= stMAck;
--jn						end if;
--jn					else
--jn						nstate <= stMNAckStop;
--jn					end if;
--jn				end if;
--jn			
--jn			when stMAck =>
--jn				if (subState = "11" and sclCnt = 0) then
--jn					nstate <= stRead;
--jn				end if;
--jn			
--jn			when stMNAckStart =>
--jn				if (arbLost = '1') then
--jn					nstate <= stIdle; -- arbitration lost, back off, no error because we got all the data
--jn				elsif (subState = "11" and sclCnt = 0) then
--jn					nstate <= stStart;
--jn				end if;
--jn			
--jn			when stMNAckStop =>
--jn				if (arbLost = '1') then
--jn					nstate <= stIdle; -- arbitration lost, back off, no error because we got all the data
--jn				elsif (subState = "11" and sclCnt = 0) then
--jn					nstate <= stStop;
--jn				end if;
--jn				
--jn         when others =>
--jn            nstate <= stIdle;
--jn      end case;      
--jn   end process;
--jn
--jn----------------------------------------------------------------------------------
--jn-- Open-drain outputs for bi-directional SDA and SCL
--jn---------------------------------------------------------------------------------- 
--jn   SDA <= 'Z' when rSDA = '1' else
--jn          '0';
--jn   SCL <= 'Z' when rSCL = '1' else
--jn          '0';
--jn			 
--jnend Behavioral;

-- CONVERT INOUT TO TRI WIRE
----------------------------------------------------------------------------------
-- Company: Digilent Ro / Updated for Vivado Block Design Compatibility
-- Engineer: Elod Gyorgy / Gemini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.math_real.all;

entity TWICtl is
    generic (CLOCKFREQ : natural := 50); -- input CLK frequency in MHz
    port (
        MSG_I  : in STD_LOGIC; -- new message
        STB_I  : in STD_LOGIC; -- strobe
        A_I    : in STD_LOGIC_VECTOR (7 downto 0); -- address input bus
        D_I    : in STD_LOGIC_VECTOR (7 downto 0); -- data input bus
        D_O    : out STD_LOGIC_VECTOR (7 downto 0); -- data output bus
        DONE_O : out STD_LOGIC; -- done status signal
        ERR_O  : out STD_LOGIC; -- error status
        CLK    : in std_logic;
        SRST   : in std_logic;
----------------------------------------------------------------------------------
-- TWI bus signals (Updated to 3-wire interface for Block Diagram)
----------------------------------------------------------------------------------
        SDA_I  : in std_logic;   -- SDA Input from IOBUF
        SDA_O  : out std_logic;  -- SDA Output to IOBUF
        SDA_T  : out std_logic;  -- SDA Tri-state control (Active-High to Float)
        SCL_I  : in std_logic;   -- SCL Input from IOBUF
        SCL_O  : out std_logic;  -- SCL Output to IOBUF
        SCL_T  : out std_logic   -- SCL Tri-state control (Active-High to Float)
    );
end TWICtl;

architecture Behavioral of TWICtl is
    attribute fsm_encoding: string;
    
    constant FSCL : natural := 400_000; 
    constant TIMEOUT : natural := 10; 
    constant TSCL_CYCLES : natural := natural(ceil(real(CLOCKFREQ*1_000_000/FSCL)));
    constant TIMEOUT_CYCLES : natural := natural(ceil(real(CLOCKFREQ*TIMEOUT*1_000)));

    type state_type is (stIdle, stStart, stRead, stWrite, stError, stStop,
        stSAck, stMAck, stMNAckStop, stMNAckStart, stStopError); 
    type busState_type is (busUnknown, busFree, busBusy);
    type error_type is (errNAck, errArb);
    
    signal state, nstate : state_type;
    attribute fsm_encoding of state: signal is "gray";    
        
    signal dSda, ddSda, dScl, ddScl : std_logic;
    signal fStart, fStop : std_logic;
    signal busState : busState_type := busUnknown;
    signal errTypeR, errType : error_type;
    signal busFreeCnt, sclCnt : natural range TSCL_CYCLES downto 0 := TSCL_CYCLES;
    signal timeOutCnt : natural range TIMEOUT_CYCLES downto 0 := TIMEOUT_CYCLES;
    signal slaveWait, arbLost : std_logic;
    signal dataByte, loadByte, currAddr : std_logic_vector(7 downto 0); 
    signal rSda, rScl : std_logic := '1';
    signal subState : std_logic_vector(1 downto 0) := "00";
    signal latchData, latchAddr, iDone, iErr, iSda, iScl, shiftBit, dataBitOut, rwBit, addrNData : std_logic;
    signal bitCount : natural range 0 to 7 := 7;
    signal int_Rst : std_logic := '0';
begin

----------------------------------------------------------------------------------                  
-- Bus State detection (Using SDA_I and SCL_I)
----------------------------------------------------------------------------------
SYNC_FFS: process(CLK)
   begin
      if Rising_Edge(CLK) then
            dSda <= SDA_I;  -- Connect to Input port
            ddSda <= dSda;
            dScl <= SCL_I;  -- Connect to Input port
      end if;
   end process;
    
    fStart <= dSCL and not dSda and ddSda; 
    fStop <= dSCL and dSda and not ddSda; 

TWISTATE: process(CLK)
   begin
      if Rising_Edge(CLK) then
            if (int_Rst = '1') then
                busState <= busUnknown;
            elsif (fStart = '1') then 
                busState <= busBusy;
            elsif (busFreeCnt = 0) then 
                busState <= busFree;
            end if;
      end if;
   end process;

TBUF_CNT: process(CLK)
   begin
      if Rising_Edge(CLK) then
          if (dSCL = '0' or dSDA = '0' or int_Rst = '1') then
             busFreeCnt <= TSCL_CYCLES;
          elsif (dSCL = '1' and dSDA = '1') then
             busFreeCnt <= busFreeCnt - 1; 
          end if;
      end if;
   end process;
    
    slaveWait <= '1' when (dSCL = '0' and rScl = '1') else '0';
    arbLost   <= '1' when (dSCL = '1' and dSDA = '0' and rSda = '1') else '0';

    RST_PROC: process (CLK)
    begin
       if Rising_Edge(CLK) then
          if (state = stIdle and SRST = '0') then
             int_Rst <= '0';
          elsif (SRST = '1') then
             int_Rst <= '1';
          end if;
       end if;
    end process;
    
SCL_CNT: process (CLK)
    begin
        if Rising_Edge(CLK) then
            if (sclCnt = 0 or state = stIdle) then
                sclCnt <= TSCL_CYCLES/4;
            elsif (slaveWait = '0') then 
                sclCnt <= sclCnt - 1;
            end if;
        end if;
    end process;

TIMEOUT_CNT: process (CLK)
    begin
        if Rising_Edge(CLK) then
            if (timeOutCnt = 0 or slaveWait = '0') then
                timeOutCnt <= TIMEOUT_CYCLES;
            elsif (slaveWait = '1') then 
                timeOutCnt <= timeOutCnt - 1;
            end if;
        end if;
    end process;
    
DATABYTE_SHREG: process (CLK) 
    begin
        if Rising_Edge(CLK) then
            if ((latchData = '1' or latchAddr = '1') and sclCnt = 0) then
                dataByte <= loadByte; 
                bitCount <= 7;
                if (latchData = '1') then
                    addrNData <= '0';
                else
                    addrNData <= '1';
                end if;
            elsif (shiftBit = '1' and sclCnt = 0) then
                dataByte <= dataByte(dataByte'high-1 downto 0) & dSDA;
                bitCount <= bitCount - 1;
            end if;
        end if;
    end process;

    loadByte <= A_I when latchAddr = '1' else D_I;
    dataBitOut <= dataByte(dataByte'high);
    D_O <= dataByte;

CURRADDR_REG: process (CLK) 
    begin
        if Rising_Edge(CLK) then
            if (latchAddr = '1') then
                currAddr <= A_I; 
            end if;
        end if;
    end process;
    
    rwBit <= currAddr(0);

SUBSTATE_CNT: process (CLK)
   begin
      if Rising_Edge(CLK) then
            if (state = stIdle) then
                subState <= "00";
            elsif (sclCnt = 0) then
                subState <= subState + 1;
            end if;
        end if;
   end process;
    
SYNC_PROC: process (CLK)
   begin
      if Rising_Edge(CLK) then
         state <= nstate;
         rSda <= iSda;
         rScl <= iScl;          
         DONE_O <= iDone;
         ERR_O <= iErr;
         errTypeR <= errType;
      end if;
   end process;

-- [Logic for OUTPUT_DECODE and NEXT_STATE_DECODE remains unchanged]
-- (Including full logic below for completeness)

OUTPUT_DECODE: process (nstate, subState, state, errTypeR, dataByte(0),
    sclCnt, bitCount, rSda, rScl, dataBitOut, arbLost, dSda, addrNData)
   begin
        iSda <= rSda; 
        iScl <= rScl;
        iDone <= '0';
        iErr <= '0';
        errType <= errTypeR; 
        shiftBit <= '0';
        latchAddr <= '0';
        latchData <= '0';
        
        if (state = stStart) then
            case (subState) is
                when "00" => iSda <= '1';
                when "01" => iSda <= '1'; iScl <= '1';
                when "10" => iSda <= '0'; iScl <= '1';
                when "11" => iSda <= '0'; iScl <= '0';
                when others =>
            end case;
        end if;
        
        if (state = stStop or state = stStopError) then
            case (subState) is
                when "00" => iSda <= '0';
                when "01" => iSda <= '0'; iScl <= '1';
                when "10" => iSda <= '1'; iScl <= '1';
                when others =>                  
            end case;
        end if;
        
        if (state = stRead or state = stSAck) then
            case (subState) is
                when "00" => iSda <= '1'; 
                when "01" => iScl <= '1';
                when "10" => iScl <= '1';
                when "11" => iScl <= '0';
                when others =>                  
            end case;
        end if;
        
        if (state = stWrite) then
            case (subState) is
                when "00" => iSda <= dataBitOut;
                when "01" => iScl <= '1';
                when "10" => iScl <= '1';
                when "11" => iScl <= '0';
                when others =>                  
            end case;
        end if;
        
        if (state = stMAck) then
            case (subState) is
                when "00" => iSda <= '0'; 
                when "01" => iScl <= '1';
                when "10" => iScl <= '1';
                when "11" => iScl <= '0';
                when others =>                  
            end case;
        end if;
        
        if (state = stMNAckStop or state = stMNAckStart) then
            case (subState) is
                when "00" => iSda <= '1'; 
                when "01" => iScl <= '1';
                when "10" => iScl <= '1';
                when "11" => iScl <= '0';
                when others =>                  
            end case;
        end if;
        
        if (state = stSAck and sclCnt = 0 and subState = "01") then
            if (dSda = '1') then
                iDone <= '1'; iErr <= '1'; errType <= errNAck;
            elsif (addrNData = '0') then
                iDone <= '1';
            end if;
        end if;
        
        if (state = stRead and subState = "01" and sclCnt = 0 and bitCount = 0) then
            iDone <= '1'; 
        end if;
        
        if (state = stWrite and arbLost = '1') then
            iDone <= '1'; iErr <= '1'; errType <= errArb;
        end if;
        
        if ((state = stWrite and sclCnt = 0 and subState = "11") or 
            ((state = stSAck or state = stRead) and subState = "01")) then 
            shiftBit <= '1';
        end if;
        
        if (state = stStart) then latchAddr <= '1'; end if;
        if (state = stSAck and subState = "11") then latchData <= '1'; end if;
    end process;
    
NEXT_STATE_DECODE: process (state, busState, slaveWait, arbLost, STB_I, MSG_I,
SRST, subState, bitCount, int_Rst, dataByte, A_I, currAddr, rwBit, sclCnt, addrNData)
   begin
      nstate <= state;  
      case (state) is
          when stIdle =>
             if (STB_I = '1' and busState = busFree and SRST = '0') then
                nstate <= stStart;
             end if;
          when stStart =>
             if (subState = "11" and sclCnt = 0) then nstate <= stWrite; end if;
          when stWrite =>
            if (arbLost = '1') then nstate <= stIdle;
            elsif (subState = "11" and sclCnt = 0 and bitCount = 0) then nstate <= stSAck;
            end if;
          when stSAck =>
            if (subState = "11" and sclCnt = 0) then
                if (int_Rst = '1' or dataByte(0) = '1') then nstate <= stStop;
                else
                    if (addrNData = '1') then 
                        if (rwBit = '1') then nstate <= stRead; else nstate <= stWrite; end if;
                    elsif (STB_I = '1') then
                        if (MSG_I = '1' or currAddr /= A_I) then nstate <= stStart;
                        else
                            if (rwBit = '1') then nstate <= stRead; else nstate <= stWrite; end if;
                        end if;
                    else nstate <= stStop;
                    end if;
                end if;
            end if;
          when stStop =>
            if (subState = "10" and sclCnt = 0) then nstate <= stIdle; end if;
          when stRead =>
            if (subState = "11" and sclCnt = 0 and bitCount = 7) then 
                if (int_Rst = '0' and STB_I = '1') then
                    if (MSG_I = '1' or currAddr /= A_I) then nstate <= stMNAckStart;
                    else nstate <= stMAck; end if;
                else nstate <= stMNAckStop; end if;
            end if;
          when stMAck =>
            if (subState = "11" and sclCnt = 0) then nstate <= stRead; end if;
          when stMNAckStart =>
            if (arbLost = '1') then nstate <= stIdle;
            elsif (subState = "11" and sclCnt = 0) then nstate <= stStart; end if;
          when stMNAckStop =>
            if (arbLost = '1') then nstate <= stIdle;
            elsif (subState = "11" and sclCnt = 0) then nstate <= stStop; end if;
          when others => nstate <= stIdle;
      end case;      
   end process;

----------------------------------------------------------------------------------
-- 3-Wire Open-drain logic for Block Diagram / Auto-Wrapper compatibility
---------------------------------------------------------------------------------- 
   -- For I2C, we only drive '0'. If internal state is '1', we float (T=1).
   SDA_O <= '0';
   SDA_T <= '1' when rSDA = '1' else '0';
   
   SCL_O <= '0';
   SCL_T <= '1' when rSCL = '1' else '0';
             
end Behavioral;
