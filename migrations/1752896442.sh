echo "Replace volume control GUI with a TUI"

if aura-cmd-missing wiremix; then
  aura-pkg-add wiremix
  aura-pkg-drop pavucontrol
  aura-refresh-applications
  aura-refresh-waybar
fi
