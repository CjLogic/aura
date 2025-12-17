echo "Replace bluetooth GUI with TUI"

aura-pkg-add bluetui
aura-pkg-drop blueberry

if ! grep -q "aura-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/aura-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
