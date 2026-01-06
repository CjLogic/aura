echo "Setting up Plymouth boot splash..."

# Copy plymouth theme
sudo mkdir -p /usr/share/plymouth/themes/aura
sudo cp -r "$HOME/.local/share/aura/default/plymouth"/* /usr/share/plymouth/themes/aura/

# Set the theme and rebuild initramfs
if [ "$(plymouth-set-default-theme)" != "aura" ]; then
  sudo plymouth-set-default-theme -R aura
  echo "Plymouth theme set to 'aura', initramfs will be rebuilt"
fi
