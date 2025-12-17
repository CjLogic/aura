# Install all base packages
mapfile -t packages < <(grep -v '^#' "$AURA_INSTALL/aura-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
