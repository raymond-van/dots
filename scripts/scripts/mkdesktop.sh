#!/bin/bash

# Check if the application name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <Application Name>"
  exit 1
fi

# Variables
APP_NAME="$1"
DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME// /_}.desktop"
ICON_DIR="$HOME/Downloads/icons"
DEFAULT_ICON="$ICON_DIR/default-icon.jpg" # Change this to another default icon if needed

# Check for a matching icon in ~/Downloads/icons/
APP_ICON=$(find "$ICON_DIR" -maxdepth 1 -type f -iname "${APP_NAME// /_}*.*" -print -quit)

# Use the found icon or fall back to the default
if [ -n "$APP_ICON" ]; then
  ICON_PATH="$APP_ICON"
else
  ICON_PATH="$DEFAULT_ICON"
fi

# Create the .desktop file
mkdir -p "$HOME/.local/share/applications"
cat << EOF > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Exec=/usr/bin/$APP_NAME
Icon=$ICON_PATH
Type=Application
Terminal=false
Categories=Utility;
EOF

# Make the .desktop file executable
chmod +x "$DESKTOP_FILE"

# Output the result
echo "Desktop entry created: $DESKTOP_FILE"
if [ -n "$APP_ICON" ]; then
  echo "Using custom icon: $APP_ICON"
else
  echo "Using default icon: $DEFAULT_ICON"
fi
