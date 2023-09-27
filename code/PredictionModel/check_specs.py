from PIL import Image
import os

def check_image_specs(folder):
    widths, heights, modes = [], [], []
    
    for filename in os.listdir(folder):
        if filename.endswith('.jpg') or filename.endswith('.png'):  # Add or modify if you have different image formats
            img = Image.open(os.path.join(folder, filename))
            widths.append(img.width)
            heights.append(img.height)
            modes.append(img.mode)
            
    print('Widths: min={}, max={}'.format(min(widths), max(widths)))
    print('Heights: min={}, max={}'.format(min(heights), max(heights)))
    print('Modes:', set(modes))

# Call the function on your directories
check_image_specs('./plots/PD')
check_image_specs('./plots/HC')
