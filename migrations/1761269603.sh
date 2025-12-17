echo "Add right-click terminal action to waybar aura menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f "$WAYBAR_CONFIG" ]] && ! grep -A5 '"custom/aura"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "aura-menu",/a\    "on-click-right": "aura-launch-terminal",' "$WAYBAR_CONFIG"
fi
