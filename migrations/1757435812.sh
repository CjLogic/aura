echo "Update Zoom webapp to handle zoommtg:// and zoomus:// protocol links"

if [[ -f ~/.local/share/applications/Zoom.desktop ]]; then
  aura-webapp-remove Zoom
  aura-webapp-install Zoom https://app.zoom.us/wc/home Zoom.png "aura-webapp-handler-zoom %u" "x-scheme-handler/zoommtg;x-scheme-handler/zoomus"
fi
