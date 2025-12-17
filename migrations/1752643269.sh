echo "Add new matte black theme"

if [[ ! -L "~/.config/aura/themes/matte-black" ]]; then
  ln -snf ~/.local/share/aura/themes/matte-black ~/.config/aura/themes/
fi
