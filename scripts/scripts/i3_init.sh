#!/bin/bash

# Applications to launch
apps=(
  # "/usr/bin/kitty"  # Terminal
  "/home/ray/.local/bin/Obsidian/Obsidian-1.7.6.AppImage"   # Note-taking app
  "/usr/bin/firefox"    # Browser
)

# Workspaces for each application
workspaces=(
  # "1"  # Workspace 1 for terminal
  "9"  # Workspace 3 for obs
  "1"  # Workspace 2 for firefox
)

# Paths to application binaries
#arr=()
#arr=( '/usr/bin/' )
#arr+=( '/home/ray/.local/bin/' )

# Counter for opened windows
owNB=0

# Launch applications in specified workspaces
for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ]; do
        owNB=$(wmctrl -l | wc -l)  # Get the current number of opened windows
    done

    i3-msg workspace ${workspaces[$iwin]}  # Move to the desired workspace
#    ${arr[$iwin]}/${apps[$iwin]} &         # Launch the application
    ${apps[$iwin]} &
done

# i3-msg workspace 1  # Move to the desired workspace

# Optional: Wait and send a message to the first terminal (remove if unnecessary)
#sleep 3
#~/scripts/ray > /dev/pts/0
#/home/ray/code/lib/pfetch/pfetch > /dev/pts/0
#/usr/bin/neofetch > /dev/pts/0
#echo "Welcome to i3!" > /dev/pts/0

