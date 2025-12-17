echo "Ensure all indexes and packages are up to date"

aura-refresh-pacman
sudo pacman -Syu --noconfirm
