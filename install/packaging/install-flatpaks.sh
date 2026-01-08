#!/bin/bash
echo "=========================================="
echo "Flatpaks"
echo "=========================================="

# Check if flatpak is installed
if ! command -v flatpak &>/dev/null; then
  echo "⚠️  Flatpak is not installed, skipping flatpak installation"
  return 0
fi

# Ensure D-Bus session is available
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  echo "Starting D-Bus session for flatpak setup..."
  eval $(dbus-launch --sh-syntax)
  export DBUS_SESSION_BUS_ADDRESS
fi

# Initialize flatpak system directories
echo "Initializing flatpak system..."
sudo mkdir -p /var/lib/flatpak

# Add flathub repository
echo "Adding flathub repository..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || {
  echo "⚠️  Failed to add flathub repository (may already exist or D-Bus issue)"
  echo "   You can add it manually after first boot with:"
  echo "   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
}

# Check if repository was added successfully
if flatpak remotes 2>/dev/null | grep -q "flathub"; then
  echo "✅ Flathub repository added successfully"

  echo "Installing flatpak applications..."
  sudo flatpak install -y flathub com.visualstudio.code 2>/dev/null || echo "⚠️  Failed to install VS Code (will be available for manual install)"
  sudo flatpak install -y flathub org.localsend.localsend_app 2>/dev/null || echo "⚠️  Failed to install LocalSend (will be available for manual install)"
  sudo flatpak install -y flathub com.github.tchx84.Flatseal 2>/dev/null || echo "⚠️  Failed to install Flatseal (will be available for manual install)"
else
  echo "⚠️  Flathub repository not available"
  echo "   Flatpak apps can be installed after first boot"
fi

echo "✅ Flatpak setup complete"
