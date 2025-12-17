echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/aura/themes/ristretto ]]; then
  ln -nfs ~/.local/share/aura/themes/ristretto ~/.config/aura/themes/
fi
