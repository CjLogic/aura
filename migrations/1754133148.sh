echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  aura-refresh-config waybar/style.css
  aura-restart-waybar
fi
