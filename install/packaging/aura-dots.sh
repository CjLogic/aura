#!/bin/bash

# Install Aura desktop environment (Aura-based with Aura customizations)
echo "Installing Aura desktop environment..."

# Ensure fish is installed (required for install.fish)
if ! command -v fish &>/dev/null; then
  echo "Installing fish shell..."
  sudo pacman -S --needed --noconfirm fish
fi

# Ensure yay is available (required by install.fish)
if ! command -v yay &>/dev/null; then
  echo "ERROR: yay not found, cannot install Aura desktop environment"
  exit 1
fi

# Install aura-cli and aura-shell from custom repository
echo "Installing aura-cli and aura-shell from Aura repository..."
sudo pacman -Sy --noconfirm aura-cli aura-shell || {
  echo "ERROR: Failed to install aura-cli and aura-shell from custom repository"
  exit 1
}

# Clone Aura-Dots to ~/.local/share/aura-dots
AURA_DOTS_PATH="$HOME/.local/share/aura-dots"
echo "Cloning Aura-Dots to $AURA_DOTS_PATH..."

# Remove existing directory if it exists
rm -rf "$AURA_DOTS_PATH"

# Clone Aura-Dots
git clone https://github.com/CjLogic/aura-dots.git "$AURA_DOTS_PATH" || {
  echo "ERROR: Failed to clone Aura-Dots"
  exit 1
}

# Run install.fish with --noconfirm and --aur-helper=yay
echo "Running Aura-Dots install script..."
cd "$AURA_DOTS_PATH"
fish install.fish --noconfirm --aur-helper=yay || {
  echo "ERROR: Aura-Dots installation failed"
  exit 1
}

# Add Aura-Dots bin to PATH for bash users
echo "Adding Aura-Dots bin to PATH..."
PROFILE_FILE="/etc/profile.d/aura-dots-bin.sh"
echo "export PATH=\"\$HOME/.local/share/aura-dots/bin:\$PATH\"" | sudo tee "$PROFILE_FILE" > /dev/null
sudo chmod +x "$PROFILE_FILE"

echo "Aura desktop environment installed successfully"
