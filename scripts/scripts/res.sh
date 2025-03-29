#!/bin/bash
set -e
# Generate the mode for 120Hz
xrandr --newmode "2420x1668_120.00" $(cvt 2420 1668 120 | tail -n 1 | cut -d ' ' -f 3-)

# Add the mode to DP-0
xrandr --addmode DP-0 "2420x1668_120.00"

# Apply the mode
xrandr --output DP-0 --mode "2420x1668_120.00"
