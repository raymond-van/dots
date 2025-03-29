#!/bin/bash
# bash -c "~/dots/scripts/scripts/ipad_res.sh"
# sh -c "nvidia-settings -a CurrentMetaMode=\"DP-4: nvidia-auto-select { ViewPortIn=${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT}, ViewPortOut=${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT}+0+0 }\""
set -e

CLIENT_WIDTH=2420
CLIENT_HEIGHT=1668
CLIENT_FPS=120
SCALE_FACTOR=0.7  # Adjust this for UI readability

modeline=$(cvt $CLIENT_WIDTH $CLIENT_HEIGHT $CLIENT_FPS | awk '/Modeline/{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12}')
mode_name="\"${CLIENT_WIDTH}x${CLIENT_HEIGHT}_${CLIENT_FPS}\""

# Create and apply new mode
xrandr --newmode $mode_name $modeline
xrandr --addmode DP-4 $mode_name

# NVIDIA MetaMode application
nvidia-settings -a CurrentMetaMode="DP-4: ${mode_name} +0+0 { \
    ViewPortIn=${CLIENT_WIDTH}x${CLIENT_HEIGHT}, \
    ViewPortOut=${CLIENT_WIDTH}x${CLIENT_HEIGHT}+0+0, \
    ForceCompositionPipeline=On, \
    ForceFullCompositionPipeline=On \
}"
# nvidia-settings -a CurrentMetaMode="DP-4: ${mode_name} +0+0 { \
#     ViewPortIn=${CLIENT_WIDTH}x${CLIENT_HEIGHT}, \
#     ViewPortOut=${CLIENT_WIDTH}x${CLIENT_HEIGHT}+0+0, \
#     ForceCompositionPipeline=On, \
#     ForceFullCompositionPipeline=On \
# }"

# GNOME UI scaling
gsettings set org.gnome.desktop.interface scaling-factor $SCALE_FACTOR
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Optional: Force fractional scaling
# xrandr --output DP-4 --scale 0.8x0.8
