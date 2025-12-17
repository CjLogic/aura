source $AURA_INSTALL/preflight/guard.sh
source $AURA_INSTALL/preflight/begin.sh
run_logged $AURA_INSTALL/preflight/show-env.sh
run_logged $AURA_INSTALL/preflight/pacman.sh
run_logged $AURA_INSTALL/preflight/migrations.sh
run_logged $AURA_INSTALL/preflight/first-run-mode.sh
run_logged $AURA_INSTALL/preflight/disable-mkinitcpio.sh
