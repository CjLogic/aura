#!/bin/bash

echo "Migrating to use aura-launch-webapp and aura-launch-browser"
for desktop_file in ~/.local/share/applications/*.desktop; do
  if grep -q 'Exec=chromium --new-window --ozone-platform=wayland --app=' "$desktop_file"; then
    url=$(grep '^Exec=' "$desktop_file" | sed -n 's/.*--app="\?\([^"]*\)"\?.*/\1/p')

    if [[ -n "$url" ]]; then
      sed -i "s|^Exec=.*|Exec=aura-launch-webapp \"$url\"|" "$desktop_file"
    fi
  fi
done

echo "Updating Hyprland bindings"
HYPR_BINDINGS_FILE="$HOME/.config/hypr/bindings.conf"
if [ -f "$HYPR_BINDINGS_FILE" ]; then
  sed -i 's/\$browser =.*chromium.*$/\$browser = aura-launch-browser/' "$HYPR_BINDINGS_FILE"
  sed -i 's/\$webapp="/aura-launch-webapp "/g' "$HYPR_BINDINGS_FILE"
  sed -i '/^\$webapp = \$browser --app/d' "$HYPR_BINDINGS_FILE"
fi
