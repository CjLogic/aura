# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(AURA_CHROOT_INSTALL|AURA_ONLINE_INSTALL|AURA_USER_NAME|AURA_USER_EMAIL|USER|HOME|AURA_REPO|AURA_REF|AURA_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
