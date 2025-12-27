#!/bin/bash

# Ensure Walker service is started automatically on boot
mkdir -p ~/.config/autostart/
cp $AURA_PATH/autostart/walker.desktop ~/.config/autostart/ || true

# Copy welcome screen autostart (runs on first login)
if [ -f "$AURA_PATH/autostart/aura-welcome.desktop" ]; then
    cp $AURA_PATH/autostart/aura-welcome.desktop ~/.config/autostart/
else
    echo "Warning: aura-welcome.desktop not found, skipping"
fi

# Create pacman hook to restart walker after updates
sudo mkdir -p /etc/pacman.d/hooks
sudo tee /etc/pacman.d/hooks/walker-restart.hook > /dev/null << EOF
[Trigger]
Type = Package
Operation = Upgrade
Target = walker
Target = walker-debug
Target = elephant*

[Action]
Description = Restarting Walker services after system update
When = PostTransaction
Exec = $AURA_PATH/bin/aura-restart-walker
EOF

# Link the visual theme menu config
mkdir -p ~/.config/elephant/menus
ln -snf $AURA_PATH/default/elephant/aura_themes.lua ~/.config/elephant/menus/aura_themes.lua
