echo "Fix JetBrains font setting"

if [[ $(aura-font-current) == JetBrains* ]]; then
  aura-font-set "JetBrainsMono Nerd Font"
fi
