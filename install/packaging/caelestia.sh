#!/bin/bash

# Install Caelestia core packages
log_section "Installing Caelestia core packages"

# Verify yay is available
if ! command -v yay &>/dev/null; then
  log "ERROR: yay not found, cannot install Caelestia AUR packages"
  exit 1
fi

# Install Caelestia core packages from AUR
# Use yes | yay to handle stdin redirection from /dev/null in run_logged
log "Installing caelestia-cli, caelestia-shell, and quickshell-git..."
yes | yay -S --needed --noconfirm caelestia-cli caelestia-shell quickshell-git || {
  log "ERROR: Failed to install Caelestia core packages"
  exit 1
}

# Install Caelestia AUR dependencies
CAELESTIA_AUR_DEPS=(
  "app2unit"
  "qt5ct-kde"
  "qt6ct-kde"
)

log "Installing Caelestia AUR dependencies..."
for pkg in "${CAELESTIA_AUR_DEPS[@]}"; do
  yes | yay -S --needed --noconfirm "$pkg" || log "WARNING: Failed to install $pkg"
done

# Install Caelestia dependencies that might be in pacman repos
CAELESTIA_DEPS=(
  "cliphist"
  "inotify-tools"
  "trash-cli"
)

for pkg in "${CAELESTIA_DEPS[@]}"; do
  if ! pacman -Q "$pkg" &>/dev/null; then
    log "Installing $pkg..."
    sudo pacman -S --needed --noconfirm "$pkg" || yay -S --needed --noconfirm "$pkg"
  fi
done

log "Caelestia core packages installed"
