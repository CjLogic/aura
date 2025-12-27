# Aura configuration deployment
# Configs are in the aura repo, copy them to user's home

echo "=========================================="
echo "Deploying Aura Configurations"
echo "=========================================="
echo "Target: $HOME"
echo "Aura Install: $AURA_INSTALL"

# Copy all configs from aura/default to .config
if [ -d "$AURA_INSTALL/../default" ]; then
    AURA_DEFAULT="$AURA_INSTALL/../default"

    # Copy each config directory (except hypr, we'll handle it specially)
    for dir in "$AURA_DEFAULT"/*; do
        if [ -d "$dir" ]; then
            dirname=$(basename "$dir")
            if [ "$dirname" != "hypr" ]; then
                echo "  - Copying $dirname to ~/.config/"
                cp -r "$dir" "$HOME/.config/"
            fi
        fi
    done

    # Copy hypr to .config/hypr
    if [ -d "$AURA_DEFAULT/hypr" ]; then
        echo "  - Copying hypr to ~/.config/hypr"
        cp -r "$AURA_DEFAULT/hypr" "$HOME/.config/"
    fi

    # Create .config/aura with user config files
    mkdir -p "$HOME/.config/aura"
    cat > "$HOME/.config/aura/hypr-user.conf" << 'EOF'
# User-specific Hyprland configuration
# Add your custom Hyprland configs here
# This file is sourced by hyprland.conf

EOF

    cat > "$HOME/.config/aura/hypr-vars.conf" << 'EOF'
# User-specific Hyprland variables
# Add your custom variables here
# This file is sourced by variables.conf

EOF

    # Copy config files
    [ -f "$AURA_DEFAULT/starship.toml" ] && cp "$AURA_DEFAULT/starship.toml" "$HOME/.config/"
    [ -f "$AURA_DEFAULT/bashrc" ] && cp "$AURA_DEFAULT/bashrc" "$HOME/.bashrc"
    [ -f "$AURA_DEFAULT/xcompose" ] && cp "$AURA_DEFAULT/xcompose" "$HOME/.XCompose"
    [ -f "$AURA_DEFAULT/xdg-terminals.list" ] && cp "$AURA_DEFAULT/xdg-terminals.list" "$HOME/.config/"

    echo ""
    echo "Copying source code..."

    # Copy aura-cli source (from /root during ISO install)
    if [ -d "/root/aura-cli" ]; then
        echo "  ✅ Found aura-cli in /root/aura-cli"
        echo "  - Copying aura-cli source to ~/.local/src/aura-cli"
        mkdir -p "$HOME/.local/src"
        cp -r "/root/aura-cli" "$HOME/.local/src/" && echo "  ✅ aura-cli source copied successfully"
    elif [ -d "$AURA_INSTALL/../../aura-cli" ]; then
        echo "  ✅ Found aura-cli in aura repo"
        echo "  - Copying aura-cli source to ~/.local/src/aura-cli (from aura repo)"
        mkdir -p "$HOME/.local/src"
        cp -r "$AURA_INSTALL/../../aura-cli" "$HOME/.local/src/" && echo "  ✅ aura-cli source copied successfully"
    else
        echo "  ❌ WARNING: aura-cli source not found!"
        echo "     Checked: /root/aura-cli and $AURA_INSTALL/../../aura-cli"
    fi

    # Copy aura-shell source (from /root during ISO install)
    if [ -d "/root/Aura-Shell" ]; then
        echo "  ✅ Found Aura-Shell in /root/Aura-Shell"
        echo "  - Copying aura-shell source to ~/.config/quickshell/aura"
        mkdir -p "$HOME/.config/quickshell"
        cp -r "/root/Aura-Shell" "$HOME/.config/quickshell/aura" && echo "  ✅ aura-shell source copied successfully"
    elif [ -d "$AURA_INSTALL/../../Aura-Shell" ]; then
        echo "  ✅ Found Aura-Shell in aura repo"
        echo "  - Copying aura-shell source to ~/.config/quickshell/aura (from aura repo)"
        mkdir -p "$HOME/.config/quickshell"
        cp -r "$AURA_INSTALL/../../Aura-Shell" "$HOME/.config/quickshell/aura" && echo "  ✅ aura-shell source copied successfully"
    else
        echo "  ❌ WARNING: Aura-Shell source not found!"
        echo "     Checked: /root/Aura-Shell and $AURA_INSTALL/../../Aura-Shell"
    fi

    echo "✅ Aura configs deployed!"
else
    echo "WARNING: Aura default configs not found at $AURA_INSTALL/../default"
    echo "Skipping config deployment."
fi

echo ""
echo "Users have:"
echo "  - Complete Hyprland configs (.config/hypr)"
echo "  - All app configs (foot, ghostty, fastfetch, etc.)"
echo "  - aura-cli source (~/.local/src/aura-cli)"
echo "  - aura-shell source (~/.config/quickshell/aura)"
echo ""
echo "To install aura-cli and aura-shell:"
echo "  Run: install-aura-full"
