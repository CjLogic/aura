echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/aura/themes/ethereal ]]; then
  rm -rf ~/.config/aura/themes/ethereal
  ln -nfs ~/.local/share/aura/themes/ethereal ~/.config/aura/themes/
fi
