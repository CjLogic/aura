# Copy all bundled icons to the applications/icons directory
ICON_DIR="$HOME/.local/share/applications/icons"
mkdir -p "$ICON_DIR"
cp ~/.local/share/aura/applications/icons/*.png "$ICON_DIR/"
