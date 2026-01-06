# Setup GDM as display manager
# GDM works great with Hyprland (and GNOME if you uncomment those packages)

echo "Setting up GDM display manager..."

# Disable SDDM if it was enabled
sudo systemctl disable sddm.service 2>/dev/null || true
sudo systemctl mask sddm.service 2>/dev/null || true

# CRITICAL: Unmask plymouth-quit services to allow proper transition to GDM
# If these are masked, Plymouth will hang and show a login prompt instead of GDM
# sudo systemctl unmask plymouth-quit.service 2>/dev/null || true
# sudo systemctl unmask plymouth-quit-wait.service 2>/dev/null || true

# Remove any custom plymouth-quit overrides that delay it
# sudo rm -f /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf 2>/dev/null || true

# Set default systemd target to graphical (required for GDM to auto-start)
sudo ln -sf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target

# Enable GDM by creating symlink manually (works in chroot)
sudo mkdir -p /etc/systemd/system/display-manager.service.d
sudo ln -sf /usr/lib/systemd/system/gdm.service /etc/systemd/system/display-manager.service

# Create Hyprland session file for GDM
sudo mkdir -p /usr/share/wayland-sessions
cat <<EOF | sudo tee /usr/share/wayland-sessions/hyprland-uwsm.desktop
[Desktop Entry]
Name=Hyprland (UWSM)
Comment=Hyprland Wayland compositor managed by UWSM
Exec=uwsm start hyprland.desktop
Type=Application
DesktopNames=Hyprland
EOF

echo "✅ GDM configured with Hyprland session"
