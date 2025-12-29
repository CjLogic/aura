#!/bin/bash
# Install yay (AUR helper) by building from source
# This must run BEFORE aura-aur.sh since yay is needed to build AUR packages

echo "=========================================="
echo "Installing yay (AUR Helper)"
echo "=========================================="

# Check if yay is already installed
if command -v yay &>/dev/null; then
    echo "✅ yay is already installed ($(yay --version | head -1))"
    return 0
fi

echo "Building yay from source..."
echo ""

# Ensure build dependencies are installed
echo "Installing build dependencies..."
sudo pacman -Syyu --needed --noconfirm git base-devel

# Create temporary build directory
BUILD_DIR=$(mktemp -d)
cd "$BUILD_DIR"

echo "Cloning yay repository..."
if git clone https://aur.archlinux.org/yay.git; then
    cd yay

    echo "Building yay package..."
    # Build as regular user (makepkg refuses to run as root)
    if makepkg -si --noconfirm --needed; then
        echo "✅ yay installed successfully!"

        # Clean up
        cd /
        rm -rf "$BUILD_DIR"

        # Verify installation
        yay --version
        return 0
    else
        echo "❌ Failed to build yay"
        cd /
        rm -rf "$BUILD_DIR"
        return 1
    fi
else
    echo "❌ Failed to clone yay repository"
    cd /
    rm -rf "$BUILD_DIR"
    return 1
fi
