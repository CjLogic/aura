#!/bin/bash
# Install all pre-built packages from local [aurlocal] repository

echo "=========================================="
echo "Installing Aura Packages"
echo "=========================================="

# Check if aurlocal repository is available
if ! pacman -Sl aurlocal &>/dev/null; then
  echo "⚠️  [aurlocal] repository not available"
  echo "   Skipping aura package installation"
  echo "   These will need to be built manually with install-aura-full"
  return 0
fi

# Get all packages from aurlocal repository (excluding -debug packages)
echo "Fetching package list from [aurlocal]..."
packages=$(pacman -Slq aurlocal | grep -v '\-debug$')

if [ -z "$packages" ]; then
  echo "⚠️  No packages found in [aurlocal] repository"
  return 0
fi

package_count=$(echo "$packages" | wc -l)
echo "Installing $package_count packages from local repo..."
echo "$packages" | tr '\n' ' '
echo

sudo pacman -S --noconfirm --needed $packages || {
  echo "⚠️  Some packages failed to install from local repo"
  echo "   You can install them later with: install-aura-full"
}

# Copy built plugin from system location to user's config
echo "Setting up aura-shell in user config..."
if [ -d "/usr/share/aura-shell/build" ] && [ -d "$HOME/.config/quickshell/aura" ]; then
  echo "  - Copying built plugin to ~/.config/quickshell/aura/build/"
  cp -r /usr/share/aura-shell/build "$HOME/.config/quickshell/aura/" 2>/dev/null || true
  echo "  ✅ aura-shell plugin installed"
elif [ -d "/usr/share/aura-shell" ]; then
  echo "  - aura-shell installed to /usr/share/aura-shell/"
  echo "  - User config will be set up from /etc/skel"
fi

echo "✅ Aura packages installation complete"
