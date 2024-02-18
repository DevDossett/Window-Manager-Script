#!/bin/bash

# Get the active window ID
active_window_id=$(xdotool getactivewindow)

# Define the gap size in pixels
gap_size=32
window_height=1080
window_width=1920
window_offset=770
decoration_offset=16

# Calculate the position and size of the window
# The X and Y coordinates will be the gap size to account for the gap on the left and top edges
# The width will be the full screen width minus the gap size times  2, and the height will be the full screen height minus the gap size times  2
x_position=$(($window_offset + ($gap_size / 2)))
y_position=$(($gap_size - $decoration_offset))
width=$((($window_width / 2) - $gap_size))
height=$(($window_height - ($gap_size * 2)))
# Use wmctrl to resize and move the window

echo "Last Cordinates: ${x_position},${y_position},${height},${width}" > ~/scripts/windowManager/lastRun.txt

wmctrl -i -r $active_window_id -e  0,$x_position,$y_position,$width,$height