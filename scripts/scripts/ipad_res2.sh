#!/bin/bash
# bash -c "~/dots/scripts/scripts/ipad_res2.sh"
# sh -c "nvidia-settings -a CurrentMetaMode=\"DP-4: nvidia-auto-select { ViewPortIn=${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT}, ViewPortOut=${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT}+0+0 }\""
set -e

CLIENT_WIDTH=2420
CLIENT_HEIGHT=1668
CLIENT_FPS=120
SCALE_FACTOR=0.7

modeline=$(gtf $CLIENT_WIDTH $CLIENT_HEIGHT $CLIENT_FPS | awk '/Modeline/{print $3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12}')
mode_name="${CLIENT_WIDTH}x${CLIENT_HEIGHT}_${CLIENT_FPS}"

xrandr --newmode "$mode_name" $modeline
xrandr --addmode DP-4 "$mode_name"

nvidia-settings -a CurrentMetaMode="DP-4: ${mode_name} +0+0 { \
    ViewPortIn=${CLIENT_WIDTH}x${CLIENT_HEIGHT}, \
    ViewPortOut=${CLIENT_WIDTH}x${CLIENT_HEIGHT}+0+0, \
    ForceCompositionPipeline=On, \
    ForceFullCompositionPipeline=On \
}"

gsettings set org.gnome.desktop.interface scaling-factor $SCALE_FACTOR
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
