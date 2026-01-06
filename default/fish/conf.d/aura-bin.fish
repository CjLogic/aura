# Add Aura bin directory to PATH
set -gx AURA_PATH "$HOME/.local/share/aura"
fish_add_path "$AURA_PATH/bin"
set -U fish_user_paths ~/.cargo/bin
