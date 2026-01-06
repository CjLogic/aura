#!/bin/bash
echo "=========================================="
echo "Flatpaks"
echo "=========================================="

# Check if flatpak is installed
if ! command -v flatpak &>/dev/null; then
  echo "⚠️  Flatpak is not installed, skipping flatpak installation"
  return 0
fi

# Initialize flatpak system directories if needed
if [ ! -d "/var/lib/flatpak" ]; then
  echo "Initializing flatpak system..."
  sudo mkdir -p /var/lib/flatpak
fi

# Add flathub repository if not already added
echo "Adding flathub repository..."
flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo || {
  echo "⚠️  Failed to add flathub repository"
  return 0
}

echo "Installing flatpak applications..."
flatpak install -y --system flathub com.visualstudio.code || echo "⚠️  Failed to install VS Code"
flatpak install -y --system flathub org.localsend.localsend_app || echo "⚠️  Failed to install LocalSend"

echo "✅ Flatpak installation complete"
