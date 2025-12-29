sudo mkdir -p /etc/sddm.conf.d

# Copy Aura SDDM theme
sudo mkdir -p /usr/share/sddm/themes/aura

# Copy background image
if [ -f "$HOME/.local/share/aura/default/plymouth/background.png" ]; then
  sudo cp "$HOME/.local/share/aura/default/plymouth/background.png" /usr/share/sddm/themes/aura/background.png
elif [ -f "/root/aura/default/plymouth/background.png" ]; then
  sudo cp "/root/aura/default/plymouth/background.png" /usr/share/sddm/themes/aura/background.png
fi

# Copy SDDM theme files
if [ -d "$HOME/.local/share/aura/default/sddm" ]; then
  sudo cp "$HOME/.local/share/aura/default/sddm/theme.conf" /usr/share/sddm/themes/aura/
  sudo cp "$HOME/.local/share/aura/default/sddm/Main.qml" /usr/share/sddm/themes/aura/
  sudo cp "$HOME/.local/share/aura/default/sddm/metadata.desktop" /usr/share/sddm/themes/aura/
elif [ -d "/root/aura/default/sddm" ]; then
  sudo cp "/root/aura/default/sddm/theme.conf" /usr/share/sddm/themes/aura/
  sudo cp "/root/aura/default/sddm/Main.qml" /usr/share/sddm/themes/aura/
  sudo cp "/root/aura/default/sddm/metadata.desktop" /usr/share/sddm/themes/aura/
fi

# Create hyprland-uwsm session file for SDDM
# sudo mkdir -p /usr/share/wayland-sessions
# cat <<EOF | sudo tee /usr/share/wayland-sessions/hyprland-uwsm.desktop
# [Desktop Entry]
# Name=Hyprland (UWSM)
# Comment=Hyprland Wayland compositor managed by UWSM
# Exec=uwsm start hyprland.desktop
# Type=Application
# EOF

if [ ! -f /etc/sddm.conf.d/autologin.conf ]; then
  cat <<EOF | sudo tee /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER
Session=hyprland-uwsm

[Theme]
Current=aura
CursorTheme=Adwaita
EOF
fi

# Don't use chrootable here as --now will cause issues for manual installs
sudo systemctl enable sddm.service
