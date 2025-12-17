echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Aura --title Aura -e aura-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Aura --title Aura -e \)aura-update"|\1aura-update"|' ~/.config/waybar/config.jsonc
  aura-restart-waybar
fi
