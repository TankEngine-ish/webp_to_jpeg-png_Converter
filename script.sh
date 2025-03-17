#!/bin/bash

# creates a file selection dialog to get the selected file path
file_path=$(zenity --file-selection --file-filter='*.webp' --title="Select a .webp image")


# Check if the user clicked "Cancel"
if [ $? -ne 0 ]; then
    exit
fi

output_format=$(zenity --list --radiolist --title="Select output format" --column="Select" --column="Format" TRUE "jpeg" FALSE "png")

if [[ $file_path == *.webp ]]; then
    if [[ $output_format == "jpeg" ]]; then
        # we convert the .webp image to .ppm format, then to .jpeg format, and afterwards we delete the .ppm file. The reason for all of that is cjpeg doesn't support webp directly afaik.
        dwebp "$file_path" -ppm -o "${file_path%.webp}.ppm" && cjpeg "${file_path%.webp}.ppm" > "${file_path%.webp}.jpg" && rm "${file_path%.webp}.ppm"
    elif [[ $output_format == "png" ]]; then
        # straight to .png
        dwebp "$file_path" -o "${file_path%.webp}.png"
    fi
   
    zenity --info --text="Image converted successfully!"
else
   
    zenity --error --text="Selected file is not a .webp image!"
fi
