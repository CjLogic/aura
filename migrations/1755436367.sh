echo "Add minimal starship prompt to terminal"

if aura-cmd-missing starship; then
  aura-pkg-add starship
  cp $AURA_PATH/config/starship.toml ~/.config/starship.toml
fi
