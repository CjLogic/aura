run_logged $AURA_INSTALL/packaging/base.sh
run_logged $AURA_INSTALL/packaging/aura-packages.sh
run_logged $AURA_INSTALL/packaging/install-flatpaks.sh
# run_logged $AURA_INSTALL/packaging/install-fresh.sh  # Disabled - cargo install takes too long
run_logged $AURA_INSTALL/packaging/fonts.sh
run_logged $AURA_INSTALL/packaging/icons.sh
run_logged $AURA_INSTALL/packaging/webapps.sh
run_logged $AURA_INSTALL/packaging/tuis.sh
