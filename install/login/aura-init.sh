#!/bin/bash
set -euo pipefail

echo "Initializing Aura shell and daemon..."

# Determine target user
TARGET_USER="${SUDO_USER:-${USER:-root}}"
TARGET_HOME="$(eval echo "~$TARGET_USER")"

STATE_DIR="${XDG_STATE_HOME:-$TARGET_HOME/.local/state}"

# Ensure aura state directory exists
sudo -u "$TARGET_USER" mkdir -p "$STATE_DIR/aura"

# Generate color scheme
if command -v aura &>/dev/null; then
  echo "Setting Aura color scheme..."
  sudo -u "$TARGET_USER" aura scheme set -n shadotheme 2>/dev/null || echo "Warning: Could not set color scheme"
  sleep 1
fi

# Start aura shell daemon as target user
if command -v aura &>/dev/null; then
  echo "Starting Aura shell daemon..."
  sudo -u "$TARGET_USER" aura shell -d >/dev/null 2>&1 || echo "Warning: Could not start aura shell daemon"
fi

# Reload Hyprland if running
if pgrep -x "Hyprland" >/dev/null; then
  echo "Reloading Hyprland configuration..."
  hyprctl reload 2>/dev/null || echo "Warning: Could not reload Hyprland"
fi

echo "Aura initialization complete"
