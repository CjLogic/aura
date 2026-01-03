# Install AUR packages with yay
# Note: yay will be installed automatically if not found

if ! command -v yay &>/dev/null; then
  echo "Installing yay AUR helper..."

  # Ensure git and base-devel are installed
  sudo pacman -S --needed --noconfirm git base-devel

  # Clone and build yay
  TEMP_DIR=$(mktemp -d)
  cd "$TEMP_DIR"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm

  # Cleanup
  cd ~
  rm -rf "$TEMP_DIR"

  # Verify installation
  if ! command -v yay &>/dev/null; then
    echo "⚠️  Failed to install yay, skipping AUR package installation"
    echo "   Install yay manually and run: yay -S \$(cat $AURA_INSTALL/aura-other.packages)"
    return 0
  fi

  echo "✅ yay installed successfully"
fi

mapfile -t packages < <(grep -v '^#' "$AURA_INSTALL/aura-other.packages" | grep -v '^$')

if [ ${#packages[@]} -eq 0 ]; then
  echo "No AUR packages to install"
  return 0
fi

echo "Installing ${#packages[@]} AUR packages with yay..."
yay -S --noconfirm --needed --removemake --cleanafter "${packages[@]}" || {
  echo "⚠️  Some AUR packages failed to install"
  echo "   You can install them later with: yay -S <package-name>"
}
