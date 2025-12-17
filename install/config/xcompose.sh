# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/aura/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$AURA_USER_NAME"
<Multi_key> <space> <e> : "$AURA_USER_EMAIL"
EOF
