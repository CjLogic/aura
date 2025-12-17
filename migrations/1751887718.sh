echo "Install Impala as new wifi selection TUI"

if aura-cmd-missing impala; then
  aura-pkg-add impala
  aura-refresh-waybar
fi
