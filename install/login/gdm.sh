# Setup GDM as display manager
# GDM works great with both GNOME and Hyprland sessions

echo "Setting up GDM display manager..."

# Disable SDDM if it was enabled
sudo systemctl disable sddm.service 2>/dev/null || true
sudo systemctl mask sddm.service 2>/dev/null || true

# CRITICAL: Unmask plymouth-quit services to allow proper transition to GDM
# If these are masked, Plymouth will hang and show a login prompt instead of GDM
sudo systemctl unmask plymouth-quit.service 2>/dev/null || true
sudo systemctl unmask plymouth-quit-wait.service 2>/dev/null || true

# Remove any custom plymouth-quit overrides that delay it
sudo rm -f /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf 2>/dev/null || true

# Set default systemd target to graphical (required for GDM to auto-start)
sudo systemctl set-default graphical.target

# Sync package database and upgrade system
echo "Syncing package database..."
sudo pacman -Syyu --noconfirm

# Ensure GDM is installed before enabling
if ! pacman -Q gdm &>/dev/null; then
    echo "⚠️  GDM not installed, installing now..."
    sudo pacman -S --noconfirm --needed gdm
fi

# Enable GDM (only if the service file exists)
if [ -f /usr/lib/systemd/system/gdm.service ]; then
    sudo systemctl enable gdm.service
else
    echo "⚠️  GDM service file not found, skipping enable (will be enabled on first boot)"
fi

# Reload systemd to pick up changes
sudo systemctl daemon-reload

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

echo "✅ GDM configured"
echo "   Available sessions:"
echo "   - Hyprland (UWSM)"
echo "   - GNOME"
echo ""
echo "After installation:"
echo "   1. Boot into GNOME session (safest for first boot)"
echo "   2. Open terminal and run: install-aura-full"
echo "   3. Log out and select Hyprland (UWSM) session"
