#!/bin/bash
set -euo pipefail

echo "Installing Aura OS environment..."

# Determine target user
TARGET_USER="${SUDO_USER:-${USER:-root}}"
TARGET_HOME="$(eval echo "~$TARGET_USER")"
echo "Target user: $TARGET_USER"
echo "Target home: $TARGET_HOME"

# Wait for network
echo "Waiting for network..."
for i in {1..30}; do
  if ping -c1 8.8.8.8 &>/dev/null || ping -c1 archlinux.org &>/dev/null; then
    echo "Network available"
    break
  fi
  echo "Attempt $i/30: waiting for network..."
  sleep 2
done

# Ensure git and fish are available
echo "Ensuring git and fish are installed..."
sudo pacman -Sy --needed --noconfirm git fish

# Clone aura-dots to ~/.local/share/aura-dots
AURA_DOTS_PATH="$TARGET_HOME/.local/share/aura-dots"
echo "Cloning Aura-Dots to $AURA_DOTS_PATH..."
sudo -u "$TARGET_USER" mkdir -p "$(dirname "$AURA_DOTS_PATH")"
sudo -u "$TARGET_USER" rm -rf "$AURA_DOTS_PATH"
if ! sudo -u "$TARGET_USER" git clone https://github.com/CjLogic/aura-dots.git "$AURA_DOTS_PATH"; then
  echo "ERROR: Failed to clone Aura-Dots"
  exit 1
fi

# Run install.fish with proper environment variables and --noconfirm
echo "Running install.fish as $TARGET_USER..."
# Note: The aura command may not be fully available yet during first install
# The install.fish script handles this gracefully by checking command availability
if [ "$TARGET_USER" = "root" ]; then
  HOME="$TARGET_HOME" XDG_CONFIG_HOME="$TARGET_HOME/.config" XDG_STATE_HOME="$TARGET_HOME/.local/state" \
  fish "$AURA_DOTS_PATH/install.fish" --noconfirm --aur-helper=yay || { echo "ERROR: install.fish failed"; exit 1; }
else
  sudo -u "$TARGET_USER" env HOME="$TARGET_HOME" XDG_CONFIG_HOME="$TARGET_HOME/.config" XDG_STATE_HOME="$TARGET_HOME/.local/state" \
  fish "$AURA_DOTS_PATH/install.fish" --noconfirm --aur-helper=yay || { echo "ERROR: install.fish failed"; exit 1; }
fi

# Add Aura-Dots bin to PATH for all users
PROFILE_FILE="/etc/profile.d/aura-dots-bin.sh"
echo 'export PATH="$HOME/.local/share/aura-dots/bin:$PATH"' | sudo tee "$PROFILE_FILE" > /dev/null
sudo chmod +x "$PROFILE_FILE"

echo "Aura OS environment installed successfully"
