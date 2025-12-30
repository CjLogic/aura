run_logged $AURA_INSTALL/packaging/base.sh
run_logged $AURA_INSTALL/packaging/other.sh
run_logged $AURA_INSTALL/packaging/fonts.sh
run_logged $AURA_INSTALL/packaging/icons.sh
run_logged $AURA_INSTALL/packaging/webapps.sh
run_logged $AURA_INSTALL/packaging/tuis.sh
# Note: Configs and source code already copied from /etc/skel during user creation
# Note: AUR packages (yay, aura-cli, aura-shell) are installed post-boot with install-aura-full
