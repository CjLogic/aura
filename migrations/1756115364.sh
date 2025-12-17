echo "Replace buggy native Zoom client with webapp"

if aura-pkg-present zoom; then
  aura-pkg-drop zoom
  aura-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
