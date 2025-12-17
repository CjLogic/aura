echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "aura-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  aura-refresh-hypridle
  aura-refresh-hyprlock
fi
