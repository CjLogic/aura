sudo mkdir -p /etc/sddm.conf.d

# Create hyprland-uwsm session file for SDDM
sudo mkdir -p /usr/share/wayland-sessions
cat <<EOF | sudo tee /usr/share/wayland-sessions/hyprland-uwsm.desktop
[Desktop Entry]
Name=Hyprland (UWSM)
Comment=Hyprland Wayland compositor managed by UWSM
Exec=uwsm start -F hyprland.desktop
Type=Application
EOF

if [ ! -f /etc/sddm.conf.d/autologin.conf ]; then
  cat <<EOF | sudo tee /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER
Session=hyprland-uwsm

[Theme]
Current=aura
EOF
fi

# Don't use chrootable here as --now will cause issues for manual installs
sudo systemctl enable sddm.service
