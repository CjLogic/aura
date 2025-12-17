echo "Allow updating of timezone by right-clicking on the clock (or running aura-cmd-tzupdate)"

if aura-cmd-missing tzupdate; then
  bash "$AURA_PATH/install/config/timezones.sh"
  aura-refresh-waybar
fi
