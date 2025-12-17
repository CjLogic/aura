echo "Migrate to proper packages for localsend and asdcontrol"

if aura-pkg-present localsend-bin; then
  aura-pkg-drop localsend-bin
  aura-pkg-add localsend
fi

if aura-pkg-present asdcontrol-git; then
  aura-pkg-drop asdcontrol-git
  aura-pkg-add asdcontrol
fi
