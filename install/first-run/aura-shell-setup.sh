#!/bin/bash
# Aura Shell first-run setup
# Sets up color scheme and configures Aura shell daemon to start automatically

echo "[Aura Setup] Running first-time Aura shell setup..."

# Setup XDG directories
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Create state directory
mkdir -p "$XDG_STATE_HOME/aura"

# Generate color scheme if aura command is available
if command -v aura >/dev/null 2>&1; then
    if [ ! -f "$XDG_STATE_HOME/aura/scheme.json" ]; then
        echo "[Aura Setup] Generating color scheme..."
        aura scheme set -n shadotheme 2>/dev/null || echo "[Aura Setup] Warning: Could not set color scheme"
        sleep 0.5
    fi
else
    echo "[Aura Setup] Warning: aura command not found, skipping color scheme setup"
fi

# Add aura shell daemon to Fish config for auto-start on shell sessions
FISH_CONFIG="$XDG_CONFIG_HOME/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    # Check if daemon startup is already configured
    if ! grep -q "aura shell -d" "$FISH_CONFIG" 2>/dev/null; then
        echo "[Aura Setup] Configuring Aura shell daemon to start automatically..."
        cat >> "$FISH_CONFIG" <<'EOF'

# Aura shell daemon auto-start
if status is-interactive
    if command -v aura >/dev/null 2>&1
        # Only start if not already running
        if not pgrep -f "aura shell" >/dev/null 2>&1
            aura shell -d >/dev/null 2>&1 &
            disown
        end
    end
end
EOF
        echo "[Aura Setup] Aura shell daemon configured!"
    fi
fi

echo "[Aura Setup] First-time setup complete!"
