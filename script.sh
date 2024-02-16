#!/bin/bash

# Use Zenity to create a file selection dialog and get the selected file path
file_path=$(zenity --file-selection --file-filter='*.webp' --title="Select a .webp image")

# Use Zenity to create a list dialog and get the selected output format
output_format=$(zenity --list --radiolist --title="Select output format" --column="Select" --column="Format" TRUE "jpeg" FALSE "png")

# Check if the selected file is a .webp image
if [[ $file_path == *.webp ]]; then
    if [[ $output_format == "jpeg" ]]; then
        # Convert the .webp image to .ppm format, then to .jpeg format, and delete the .ppm file
        dwebp "$file_path" -o "${file_path%.webp}.ppm" && cjpeg "${file_path%.webp}.ppm" > "${file_path%.webp}.jpg" && rm "${file_path%.webp}.ppm"
    elif [[ $output_format == "png" ]]; then
        # Convert the .webp image to .png format
        dwebp "$file_path" -o "${file_path%.webp}.png"
    fi
    # Use Zenity to show a success message
    zenity --info --text="Image converted successfully!"
else
    # Use Zenity to show an error message
    zenity --error --text="Selected file is not a .webp image!"
fi