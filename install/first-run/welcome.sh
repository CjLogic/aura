# Check if welcome has already been shown
if [ -f ~/.local/state/aura/welcome-shown ]; then
    echo "Welcome message already shown. Skipping..."
    exit 0
fi

# Display welcome notification
notify-send "    Welcome to AuraOS!" "Opening welcome guide..." -u normal -t 3000

# Launch welcome modal in a floating terminal
# Check which terminal is available
if command -v ghostty &>/dev/null; then
    ghostty --class="aura-welcome" -e "$HOME/.local/share/aura/bin/aura-welcome-modal" &
elif command -v foot &>/dev/null; then
    foot --app-id="aura-welcome" "$HOME/.local/share/aura/bin/aura-welcome-modal" &
elif command -v kitty &>/dev/null; then
    kitty --class="aura-welcome" "$HOME/.local/share/aura/bin/aura-welcome-modal" &
elif command -v gnome-terminal &>/dev/null; then
    gnome-terminal --class="aura-welcome" -- "$HOME/.local/share/aura/bin/aura-welcome-modal" &
else
    # Fallback to xterm if nothing else is available
    xterm -class "aura-welcome" -e "$HOME/.local/share/aura/bin/aura-welcome-modal" &
fi
