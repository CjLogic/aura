#!/bin/bash

# Symlink Caelestia configs to ~/.config
log_section "Installing Caelestia configurations"

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Function to safely symlink config
symlink_config() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] || [ -L "$target" ]; then
    log "Backing up existing $target to $target.aura-backup"
    mv "$target" "$target.aura-backup"
  fi

  log "Symlinking $source -> $target"
  ln -sf "$source" "$target"
}

# Symlink Hyprland config
if [ -d "$AURA_PATH/config/hypr" ]; then
  symlink_config "$AURA_PATH/config/hypr" "$CONFIG_DIR/hypr"
  log "Hyprland config installed"
fi

# Symlink Fish config
if [ -d "$AURA_PATH/config/fish" ]; then
  symlink_config "$AURA_PATH/config/fish" "$CONFIG_DIR/fish"
  log "Fish shell config installed"
fi

# Symlink Foot terminal
if [ -d "$AURA_PATH/config/foot" ]; then
  symlink_config "$AURA_PATH/config/foot" "$CONFIG_DIR/foot"
  log "Foot terminal config installed"
fi

# Symlink Starship
if [ -f "$AURA_PATH/config/starship.toml" ]; then
  symlink_config "$AURA_PATH/config/starship.toml" "$CONFIG_DIR/starship.toml"
  log "Starship config installed"
fi

# Symlink Fastfetch
if [ -d "$AURA_PATH/config/fastfetch" ]; then
  symlink_config "$AURA_PATH/config/fastfetch" "$CONFIG_DIR/fastfetch"
  log "Fastfetch config installed"
fi

# Symlink Btop
if [ -d "$AURA_PATH/config/btop" ]; then
  symlink_config "$AURA_PATH/config/btop" "$CONFIG_DIR/btop"
  log "Btop config installed"
fi

# Symlink Uwsm
if [ -d "$AURA_PATH/config/uwsm" ]; then
  symlink_config "$AURA_PATH/config/uwsm" "$CONFIG_DIR/uwsm"
  log "Uwsm config installed"
fi

# Symlink VSCode
if [ -d "$AURA_PATH/config/vscode" ]; then
  mkdir -p "$CONFIG_DIR/VSCodium/User" "$CONFIG_DIR/Code/User"

  if [ -f "$AURA_PATH/config/vscode/settings.json" ]; then
    symlink_config "$AURA_PATH/config/vscode/settings.json" "$CONFIG_DIR/VSCodium/User/settings.json"
    symlink_config "$AURA_PATH/config/vscode/settings.json" "$CONFIG_DIR/Code/User/settings.json"
  fi

  if [ -f "$AURA_PATH/config/vscode/keybindings.json" ]; then
    symlink_config "$AURA_PATH/config/vscode/keybindings.json" "$CONFIG_DIR/VSCodium/User/keybindings.json"
    symlink_config "$AURA_PATH/config/vscode/keybindings.json" "$CONFIG_DIR/Code/User/keybindings.json"
  fi

  log "VSCode/VSCodium config installed"
fi

# Symlink Micro
if [ -d "$AURA_PATH/config/micro" ]; then
  symlink_config "$AURA_PATH/config/micro" "$CONFIG_DIR/micro"
  log "Micro editor config installed"
fi

# Symlink Zed
if [ -d "$AURA_PATH/config/zed" ]; then
  symlink_config "$AURA_PATH/config/zed" "$CONFIG_DIR/zed"
  log "Zed editor config installed"
fi

# Symlink Thunar
if [ -d "$AURA_PATH/config/thunar" ]; then
  symlink_config "$AURA_PATH/config/thunar" "$CONFIG_DIR/thunar"
  log "Thunar file manager config installed"
fi

# Symlink other configs
for config in waybar walker swayosd lazygit git fontconfig fcitx5 environment.d systemd hyprland-preview-share-picker; do
  if [ -d "$AURA_PATH/config/$config" ] || [ -f "$AURA_PATH/config/$config" ]; then
    symlink_config "$AURA_PATH/config/$config" "$CONFIG_DIR/$config"
    log "$config config installed"
  fi
done

log "All Caelestia configs symlinked successfully"
