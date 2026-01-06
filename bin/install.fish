#!/usr/bin/env fish
# Aura first-run setup script
# This script initializes the Aura shell environment on first login

# Setup XDG directories
set -q XDG_STATE_HOME || set -l XDG_STATE_HOME "$HOME/.local/state"
set -q XDG_CONFIG_HOME || set -l XDG_CONFIG_HOME "$HOME/.config"

# Create state directory
mkdir -p "$XDG_STATE_HOME/aura"

# Marker file to track if first-run setup is complete
set -l setup_marker "$XDG_STATE_HOME/aura/.setup-complete"

# Simple logging function
function aura_log
    echo "[Aura Setup]" $argv
end

# Only run full setup on first login
if not test -f "$setup_marker"
    aura_log "Running first-time Aura setup..."

    # Generate color scheme if needed
    if not test -f "$XDG_STATE_HOME/aura/scheme.json"
        if command -v aura >/dev/null 2>&1
            aura_log "Generating color scheme..."
            aura scheme set -n shadotheme 2>/dev/null || aura_log "Warning: Could not set color scheme"
            sleep 0.5

            # Only reload Hyprland if it's running
            if pgrep -x Hyprland >/dev/null 2>&1
                aura_log "Reloading Hyprland configuration..."
                hyprctl reload 2>/dev/null || aura_log "Warning: Could not reload Hyprland"
            end
        else
            aura_log "Warning: aura command not found, skipping color scheme setup"
        end
    end

    # Mark setup as complete
    touch "$setup_marker"
    aura_log "First-time setup complete!"
end

# Always start the shell daemon on login (if not already running)
if command -v aura >/dev/null 2>&1
    # Check if daemon is already running
    if not pgrep -f "aura shell" >/dev/null 2>&1
        aura_log "Starting Aura shell daemon..."
        aura shell -d >/dev/null 2>&1 &
        disown
    end
else
    aura_log "Warning: aura command not available"
end
