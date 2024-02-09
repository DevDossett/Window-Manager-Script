#!/bin/bash

# Find the window ID of Visual Studio Code
vscode_window_id=$(wmctrl -l | grep "Visual Studio Code" | awk '{print $1}')

# Check if the window ID was found
# if [ ! -z "$vscode_window_id" ]; then
#     wmctrl -i -r "$vscode_window_id" -e 0,18,1132,900,1330
# else
#     echo "Visual Studio Code not open."
# fi

# brave_window_id=$(wmctrl -l | grep "Brave" | awk '{print $1}')

# if [ ! -z "$brave_window_id" ]; then
#     wmctrl -i -r "$brave_window_id" -e 0,920,1122,1862,1410
# else
#     echo "Brave not open."
# fi

# dev_tools_window_id=$(wmctrl -l | grep "DevTools" | awk '{print $1}')

# if [ ! -z "$dev_tools_window_id" ]; then
#     wmctrl -i -r "$dev_tools_window_id" -e 0,2784,1132,642,1330
# else
#     echo "DevTools not open."
# fi


windows=("Visual Studio Code|0,18,1132,900,1330" "Brave|0,920,1122,1862,1410" "DevTools|0,2784,1132,642,1330")

for window_info in "${windows[@]}"; do
    name=$(echo "$window_info" | awk -F '|' '{print $1}')
    id=$(wmctrl -l | grep "$name" | awk '{print $1}')
    coords=$(echo "$window_info" | awk -F '|' '{print $2}')
    if [ ! -z "$id" ]; then
        wmctrl -i -r "$id" -e $coords
    else
        echo "$name not open."
    fi
done