# AsciiMovie
This program isn't very optimised, as it has been a quick project used for a music video (link coming soon). By default the program is limited to 6 fps this can be manually changed by changning `RECORDING_FPS` value, You may increase it if you increase `SCALE` and depending on the video resolution.

## Getting Started
1. Download processing here: https://processing.org/download
2. Download and extract this repository where ever you want it.
3. Open the program, by double-clicking the .pde file, inside the folder you just extracted.
Now we need a library made by Processing. This library is nessacary to read video files such as .mp4, .mv4, .mov etc.
4. Go to `Sketch > Import Library > Video` If it is not there, then click `Add library` instead of `Video`. A new window should open, search for "Video" inside the searchbar. Find "Video | GStreamer...." by The Processing Foundation and click `Install`.
![image](https://user-images.githubusercontent.com/41763143/158257737-64670bc4-9676-40ab-ac1b-12b02166e1c6.png)

### Running the program
1. Put a video clip into the `data` folder
2. Change `VIDEO_FILE_NAME` to the name of the clip
3. Change `VIDEO_X_RESOLUTION` and `VIDEO_Y_RESOLUTION` 
to the resolution of the clip.
4. Run the program

### Generate a video
After the video has rendered, all frames should ne located in `output/frames`.
1. Open the built-in processing's movie maker, by going to `Tools > Movie Maker`.
3. Select the ouput folder where the frames are located where it asks
![image](https://user-images.githubusercontent.com/41763143/158256000-5ddaef25-eb0d-4a71-bcb8-b93418df21a5.png)
4. Set `Framerate` to the framerate of the clip used, usuallyy this would be 25, 30 or 60.
5. Keep `Same size as originals` enabled
6. Select the `Compression` that works best for you, for windows users it would be MPEG-4
7. Click `Create movie...` and select where it save it to.

### Change Density
Set `DENSITY_INDEX` to either `0, 1, 2, 3, 4` to which is the different sets of characters the program will use.

### Change font color
You can change each color component red, green and blue seperate using `TEXT_COLOR_R` `TEXT_COLOR_G` `TEXT_COLOR_B`. The values must be between 0-255, you can use https://htmlcolors.com/google-color-picker, where you just have to pick a color and use the rgb(r,g,b) value from the websites gives you, as the values for the font color.

### Testing
While testing your settings, I would recommend setting `recording` to `false`,  
