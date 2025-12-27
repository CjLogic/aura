#!/bin/bash
# Install AUR packages from offline repository

echo "Installing AUR packages from offline repository..."

# Read AUR packages list
if [ ! -f "$AURA_INSTALL/aura-aur.packages" ]; then
    echo "aura-aur.packages not found, skipping AUR package installation"
    return 0
fi

aur_packages=($(grep -v '^#' "$AURA_INSTALL/aura-aur.packages" | grep -v '^$' || true))

if [ ${#aur_packages[@]} -eq 0 ]; then
    echo "No AUR packages to install"
    return 0
fi

echo "Will attempt to install ${#aur_packages[@]} AUR packages..."

# Install all AUR packages from the offline repository
# Use --needed to skip already installed packages
# Use --noconfirm for automated installation
# Use || true to not fail the installation if packages aren't available
sudo pacman -S --needed --noconfirm "${aur_packages[@]}" 2>&1 || true

echo "✅ AUR packages installation attempt complete!"
