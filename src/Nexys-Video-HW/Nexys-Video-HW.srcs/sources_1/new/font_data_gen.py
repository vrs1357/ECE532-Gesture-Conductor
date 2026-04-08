# Reads default font style and generates a bitmap for usable ASCII characters
# The bitmap is 1-dimensional
# Every 256 (16x16) bits represents 1 ASCII character
# Each character is defined by drawing the pixel as transparent, black (outline) or white (core)

import os
from PIL import Image, ImageFont, ImageDraw

OUTPUT_FILE = "font_data.mem"
CHAR_SIZE = 16 

def generate_ascii_rom():
    # 2-bit codes: 0=Transparent, 1=Black Outline, 2=White Core
    TRANS, BLACK, WHITE = 0, 1, 2

    font = ImageFont.load_default()

    mem_entries = []

    # Iterate through all 128 ASCII positions, in the verilog the character will be interpreted directly
    for i in range(128):
        # Create a 16x16 blank canvas
        img = Image.new('L', (CHAR_SIZE, CHAR_SIZE), 0)
        
        # Only draw printable characters which are from 32 to 126
        if 32 <= i <= 126:
            draw = ImageDraw.Draw(img)
            char = chr(i)
            
            # Center the character on the canvas
            bbox = draw.textbbox((0, 0), char, font=font)
            w, h = bbox[2] - bbox[0], bbox[3] - bbox[1]
            draw.text(((CHAR_SIZE-w)//2, (CHAR_SIZE-h)//2 - 1), char, font=font, fill=255)
        
        pix = img.load()
        
        # Process every single pixel for this character
        for y in range(CHAR_SIZE):
            for x in range(CHAR_SIZE):
                # Detect is pixel is part of the core text
                if pix[x, y] > 128:
                    mem_entries.append(WHITE)
                else:
                    # Detect if this pixel is a neighbor of a white pixel by checking nearest neighbors to do outlining
                    is_edge = False
                    for dy in [-1, 0, 1]:
                        for dx in [-1, 0, 1]:
                            nx, ny = x + dx, y + dy
                            if 0 <= nx < CHAR_SIZE and 0 <= ny < CHAR_SIZE:
                                if pix[nx, ny] > 128:
                                    is_edge = True
                    mem_entries.append(BLACK if is_edge else TRANS)

    # Write to .mem file with hex format
    with open(OUTPUT_FILE, 'w') as f:
        for val in mem_entries:
            f.write(f"{val}\n")

if __name__ == "__main__":
    generate_ascii_rom()
