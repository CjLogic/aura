echo "Change to aura-nvim package"
aura-pkg-drop aura-lazyvim
aura-pkg-add aura-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
aura-nvim-setup
