# FPGA Gesture-Controlled Music Conductor
This repository contains the hardware and software design for a real-time, gesture-controlled music conductor system. Built on the Xilinx Nexys Video platform, the project integrates high-definition video processing with a custom audio pipeline to allow users to manipulate music parameters through physical movement.

## Project Overview
The system utilizes a MicroBlaze soft-processor to coordinate an HDMI video stream and an I2S audio interface. By processing video frames to detect skin masks and centroids, the system translates hand gestures into real-time audio adjustments such as pitch shifting, equalization (bass/treble), and stereo panning.


## Key Features
Real-Time Video Analytics: Custom hardware cores for RGB-to-HSV conversion and centroid detection to track user gestures.  

Dynamic Audio Pipeline: FPGA-based audio engine featuring an I2S controller and real-time signal processing.  

Embedded Control: A MicroBlaze-based firmware stack that manages IP cores and system-level coordination.  

HDMI Integration: Full video pass-through with custom UI overlays generated on-the-fly.


## Repository Structure
- `/doc`: Contains the final engineering report and the demo presentation.  

- `/src/Nexys-Video-HW`: The primary Vivado 2024.1 project directory.  

  - `.board`: Board definition files for the Nexys Video.  

  - `.ipdefs`: External IP libraries including axi_dynclk and HDMI interfaces (dvi2rgb, rgb2dvi).  

  - `.srcs/constrs_1`: System constraints, including master XDC files and specific timing workarounds for the VDMA.  

  - `.srcs/sources_1`: Hardware Description Language (HDL) files.

    - `bd/hdmi`: Block design for the HDMI data path.  

    - `new/`: Custom Verilog and VHDL modules for centroid_core, rgb2hsv conversion, and UI overlays.  

`/src/Vitis-SDK-Files`: C-based firmware for the MicroBlaze processor.  

  - `video_demo.c`: The main application logic managing the system state and user interface.  

  - `src/`: Specialized drivers for display control, dynamic clocking, and interrupt handling.


  ## Hardware Requirements
Xilinx Nexys Video FPGA Board.  

HDMI Input Source (e.g., Camera or PC).

HDMI Output Display.  

Audio Output (Speakers/Headphones).

## Tools Used
Vivado Design Suite 2024.1: For synthesis, implementation, and bitstream generation.  

Vitis Unified Software Platform: For MicroBlaze firmware development.
