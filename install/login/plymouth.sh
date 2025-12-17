if [ "$(plymouth-set-default-theme)" != "aura" ]; then
  sudo cp -r "$HOME/.local/share/aura/default/plymouth" /usr/share/plymouth/themes/aura/
  sudo plymouth-set-default-theme aura
fi
