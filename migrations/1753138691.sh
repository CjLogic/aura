echo "Install swayOSD to show volume status"

if aura-cmd-missing swayosd-server; then
  aura-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
