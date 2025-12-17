#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Aura locations
export AURA_PATH="$HOME/.local/share/aura"
export AURA_INSTALL="$AURA_PATH/install"
export AURA_INSTALL_LOG_FILE="/var/log/aura-install.log"
export PATH="$AURA_PATH/bin:$PATH"

# Install
source "$AURA_INSTALL/helpers/all.sh"
source "$AURA_INSTALL/preflight/all.sh"
source "$AURA_INSTALL/packaging/all.sh"
source "$AURA_INSTALL/config/all.sh"
source "$AURA_INSTALL/login/all.sh"
source "$AURA_INSTALL/post-install/all.sh"
