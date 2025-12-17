echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $AURA_PATH/default/elephant/aura_themes.lua ~/.config/elephant/menus/aura_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
aura-restart-walker
