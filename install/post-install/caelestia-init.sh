#!/bin/bash

# Initialize Caelestia shell and scheme
log_section "Initializing Caelestia"

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"

# Generate default color scheme if it doesn't exist
if [ ! -f "$STATE_DIR/caelestia/scheme.json" ]; then
  log "Generating Caelestia color scheme..."

  # Use caelestia CLI to set default scheme
  if command -v caelestia &>/dev/null; then
    caelestia scheme set -n shadotheme 2>/dev/null || log "Warning: Could not generate color scheme"
    sleep 0.5
  else
    log "Warning: caelestia CLI not found, skipping scheme generation"
  fi
fi

# Start caelestia shell daemon
if command -v caelestia &>/dev/null; then
  log "Starting Caelestia shell daemon..."
  caelestia shell -d >/dev/null 2>&1 || log "Warning: Could not start caelestia shell daemon"
else
  log "Warning: caelestia CLI not found, skipping shell daemon"
fi

# Reload Hyprland if running
if pgrep -x "Hyprland" >/dev/null; then
  log "Reloading Hyprland configuration..."
  hyprctl reload 2>/dev/null || log "Warning: Could not reload Hyprland"
fi

log "Caelestia initialization complete"
