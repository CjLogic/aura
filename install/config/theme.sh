# Set links for Nautilius action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup theme links
mkdir -p ~/.config/aura/themes
for f in ~/.local/share/aura/themes/*; do ln -nfs "$f" ~/.config/aura/themes/; done

# Set initial theme
mkdir -p ~/.config/aura/current
ln -snf ~/.config/aura/themes/tokyo-night ~/.config/aura/current/theme
ln -snf ~/.config/aura/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/aura/current/background

# Set specific app links for current theme
# ~/.config/aura/current/theme/neovim.lua -> ~/.config/nvim/lua/plugins/theme.lua is handled via aura-setup-nvim

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/aura/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/aura/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium and Brave for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
