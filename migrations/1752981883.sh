echo "Replace wofi with walker as the default launcher"

if aura-cmd-missing walker; then
  aura-pkg-add walker-bin libqalculate

  aura-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/aura/config/walker/* ~/.config/walker/
fi
