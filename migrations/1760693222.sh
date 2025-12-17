echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/aura-cmd-tzupdate/aura-launch-floating-terminal-with-presentation aura-tz-select/g' ~/.config/waybar/config.jsonc
