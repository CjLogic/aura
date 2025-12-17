echo "Move Aura Package Repository after Arch core/extra/multilib and remove AUR"

aura-refresh-pacman
sudo pacman -Syu --noconfirm
