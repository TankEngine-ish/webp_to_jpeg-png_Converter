# Webp_To_JPEG-PNG_Converter


WebP Image Converter is a simple utility that allows you to convert WebP images to JPEG or PNG format. It uses a graphical user interface to select files and choose the output format.

## Dependencies

The script requires the following dependencies:

* Zenity: for the GUI dialogs.
* WebP: for the dwebp tool to convert WebP images to other formats.
* libjpeg-turbo-progs: for the cjpeg tool to convert images to JPEG format.

You can install these packages on Ubuntu with the following commands:

```
sudo apt-get install zenity
sudo apt-get install webp
sudo apt-get install libjpeg-turbo-progs
```

## Usage

To use the script, simply double-click the WebpConverter.desktop file on your desktop. This will open a file selection dialog where you can select a .webp image. After you select an image, a list dialog will open where you can select the output format (.jpeg or .png). The script will then convert the image to the selected format.

## Installation

To install the script, follow these steps:

Clone or download the project.
Move the WebpConverter.desktop file to your desktop:

```
mv /path/to/project/WebpConverter.desktop ~/Desktop/
```

Make the .desktop file executable:

```
chmod +x ~/Desktop/WebpConverter.desktop
```

Replace /path/to/project/ with the actual path to your project directory.
Also you might need to right click on the icon first and press "Allow Launching".


Here's a short gif:

![gif](./assets/video_app.gif) 

