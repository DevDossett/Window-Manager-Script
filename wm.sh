#!/bin/bash

## Add windows here. The format is Window Name|wmctrl coords
# Run wmctrl -lG to list all currently open windows
windows=("Visual Studio Code|0,18,1132,900,1330" "Brave|0,920,1122,1862,1410" "DevTools|0,2784,1132,642,1330" "Spotify|0,1256,20,857,1016")

# Loop through windows array
for window_info in "${windows[@]}"; do
    # Get the window name from the first column
    name=$(echo "$window_info" | awk -F '|' '{print $1}')
    # Getting the window id by using grep to get the line
    # the name is on, then using awk to grab the id from the
    # first column
    id=$(wmctrl -l | grep "$name" | awk '{print $1}')
    # Getting the cords from the windows awway
    coords=$(echo "$window_info" | awk -F '|' '{print $2}')
    # If the id exists then run the wmctrl command
    if [ ! -z "$id" ]; then
        wmctrl -i -r "$id" -e $coords
    else
        # if not print window not open
        echo "$name not open."
    fi
done