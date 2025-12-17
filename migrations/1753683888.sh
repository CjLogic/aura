echo "Adding Aura version info to fastfetch"
if ! grep -q "aura" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/aura/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi
