echo "Add emergency entry for Walker"
CONFIG_FILE="$HOME/.config/walker/config.toml"

if [[ -f "$CONFIG_FILE" ]] && ! grep -q 'command = "aura-restart-walker"' "$CONFIG_FILE"; then
    cat >> "$CONFIG_FILE" << 'EOF'

[[emergencies]]
text = "Restart Walker"
command = "aura-restart-walker"
EOF
fi
