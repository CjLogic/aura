echo "Update fastfetch config with new Aura logo"

aura-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/aura/branding
cp $AURA_PATH/icon.txt ~/.config/aura/branding/about.txt
