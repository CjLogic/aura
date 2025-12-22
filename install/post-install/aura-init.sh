#!/bin/bash

# Initialize Aura shell and scheme
echo "Initializing Aura"

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"

# Generate default color scheme if it doesn't exist
if [ ! -f "$STATE_DIR/aura/scheme.json" ]; then
  echo "Generating Aura color scheme..."

  # Use aura CLI to set default scheme
  if command -v aura &>/dev/null; then
    aura scheme set -n shadotheme 2>/dev/null || echo "Warning: Could not generate color scheme"
    sleep 0.5
  else
    echo "Warning: aura CLI not found, skipping scheme generation"
  fi
fi

# Start aura shell daemon
if command -v aura &>/dev/null; then
  echo "Starting Aura shell daemon..."
  aura shell -d >/dev/null 2>&1 || echo "Warning: Could not start aura shell daemon"
else
  echo "Warning: aura CLI not found, skipping shell daemon"
fi

# Reload Hyprland if running
if pgrep -x "Hyprland" >/dev/null; then
  echo "Reloading Hyprland configuration..."
  hyprctl reload 2>/dev/null || echo "Warning: Could not reload Hyprland"
fi

echo "Aura initialization complete"
