echo "Update Waybar for new Aura menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  aura-refresh-waybar
fi
