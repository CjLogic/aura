# Copy over Aura configs
mkdir -p ~/.config
cp -R ~/.local/share/aura/default/* ~/.config/

# Use default bashrc from Aura
cp ~/.local/share/aura/default/bashrc ~/.bashrc
