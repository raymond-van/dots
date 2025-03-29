#!/bin/bash
# nvidia-settings -a CurrentMetaMode=\"DP-4: nvidia-auto-select { ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0 }"
set -e

# Native display specs
NATIVE_WIDTH=1920
NATIVE_HEIGHT=1080
NATIVE_FPS=240
MODE_NAME="\"${NATIVE_WIDTH}x${NATIVE_HEIGHT}_${NATIVE_FPS}\""

# Reset NVIDIA MetaMode
nvidia-settings -a CurrentMetaMode="DP-4: ${NATIVE_WIDTH}x${NATIVE_HEIGHT}_${NATIVE_FPS} +0+0 { \
    ViewPortIn=${NATIVE_WIDTH}x${NATIVE_HEIGHT}, \
    ViewPortOut=${NATIVE_WIDTH}x${NATIVE_HEIGHT}+0+0 \
}"

# Remove custom mode
xrandr --delmode DP-4 $MODE_NAME
xrandr --rmmode $MODE_NAME

# Reset GNOME scaling
gsettings reset org.gnome.desktop.interface scaling-factor
gsettings reset org.gnome.mutter experimental-features

# Optional: Reset xrandr scaling
xrandr --output DP-4 --scale 1x1
