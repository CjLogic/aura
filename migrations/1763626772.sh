echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/aura/themes/hackerman ]]; then
  rm -rf ~/.config/aura/themes/hackerman
  ln -nfs ~/.local/share/aura/themes/hackerman ~/.config/aura/themes/
fi
