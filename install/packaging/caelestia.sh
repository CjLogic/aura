#!/bin/bash

# Install Caelestia core packages
log_section "Installing Caelestia core packages"

# Install caelestia-cli and caelestia-shell from AUR
yay -S --needed --noconfirm caelestia-cli caelestia-shell

# Install Caelestia dependencies that aren't already in base packages
CAELESTIA_DEPS=(
  "app2unit"
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
