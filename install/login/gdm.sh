# Setup GDM as display manager
# GDM works great with both GNOME and Hyprland sessions

echo "Setting up GDM display manager..."

# Disable SDDM if it was enabled
sudo systemctl disable sddm.service 2>/dev/null || true
sudo systemctl mask sddm.service 2>/dev/null || true

# Enable GDM
sudo systemctl enable gdm.service

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
