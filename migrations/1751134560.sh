echo "Add UWSM env"

export AURA_PATH="$HOME/.local/share/aura"
export PATH="$AURA_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export AURA_PATH=$HOME/.local/share/aura
export PATH=$AURA_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
aura-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/aura/migrations
touch ~/.local/state/aura/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old Aura installs
aura-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $AURA_PATH/migrations/1756060611.sh
touch ~/.local/state/aura/migrations/1756060611.sh

bash aura-update-perform
