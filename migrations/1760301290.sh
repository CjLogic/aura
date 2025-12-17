echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/aura/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/aura/themes/flexoki-light ~/.config/aura/themes/
fi
