# Install AUR packages with yay
# Note: yay must be installed first (should be in aura-base.packages or installed separately)

if ! command -v yay &>/dev/null; then
  echo "⚠️  yay not found, skipping AUR package installation"
  echo "   Install yay manually and run: yay -S \$(cat $AURA_INSTALL/aura-other.packages)"
  return 0
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
