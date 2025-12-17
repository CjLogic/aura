echo "Uniquely identify terminal apps with custom app-ids using aura-launch-tui"

# Replace terminal -e calls with aura-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/aura-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use aura-launch-or-focus with aura-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|aura-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.aura\.Wiremix -e wiremix|aura-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
