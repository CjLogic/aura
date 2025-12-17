echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/aura/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/aura/themes/catppuccin-latte ~/.config/aura/themes/
fi
