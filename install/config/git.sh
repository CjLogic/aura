# Set identification from install inputs
if [[ -n "${AURA_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$AURA_USER_NAME"
fi

if [[ -n "${AURA_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$AURA_USER_EMAIL"
fi
