echo "Add new Aura Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/aura/config/aura.ttf ~/.local/share/fonts/
fc-cache
