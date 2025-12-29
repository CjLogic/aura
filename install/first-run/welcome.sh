# Display welcome notification
notify-send "    Welcome to AuraOS!" "Please check your terminal for important setup instructions." -u critical

# Display full welcome message in terminal
cat << 'EOF'

     ╔═══════════════════════════════════════════════════════════════════╗
     ║                    Welcome to AuraOS!                             ║
     ║          Beautiful Aesthetics Meets Powerful Dev Tools            ║
     ╚═══════════════════════════════════════════════════════════════════╝

            🎉 CONGRATULATIONS! Your AuraOS installation is complete!

     ┌─────────────────────────────────────────────────────────────────┐
     │         IMPORTANT: Setup Instructions                           │
     └─────────────────────────────────────────────────────────────────┘

         You are currently in GNOME (backup session). To get the full
         Aura Hyprland experience, follow these steps:

         STEP 1: Install Aura components (you're here!)
         ───────────────────────────────────────────
         Run this command to install aura-cli and aura-shell:

             install-aura-full

         This will:
         • Download and build AUR dependencies (quickshell-git, etc.)
         • Build aura-cli from source
         • Build aura-shell from source
         • Takes 10-30 minutes depending on your system

         STEP 2: Switch to Hyprland session
         ───────────────────────────────────
         After install-aura-full completes:
         1. Log out (top-right corner → Power → Log Out)
         2. At GDM login screen, click the gear icon ⚙️
         3. Select "Hyprland (UWSM)"
         4. Log back in

         ✨ Welcome to the beautiful Aura Hyprland desktop!

     ┌─────────────────────────────────────────────────────────────────┐
     │                     Essential Keybindings                       │
     └─────────────────────────────────────────────────────────────────┘

       SUPER + RETURN       Open terminal
       SUPER + SPACE        Application launcher (walker)
       SUPER + Q            Close window
       SUPER + 1-9          Switch workspaces
       SUPER + SHIFT + 1-9  Move window to workspace
       SUPER + F            Toggle fullscreen
       SUPER + V            Toggle floating

     ┌─────────────────────────────────────────────────────────────────┐
     │ Session Switching                                                │
     └─────────────────────────────────────────────────────────────────┘

     You have two desktop sessions available:

     • GNOME - Safe fallback session (current)
       - Use for initial setup and package installation
       - Use if Hyprland has issues

     • Hyprland (UWSM) - Beautiful Aura desktop
       - Switch to this after running install-aura-full
       - Main desktop experience with all customizations

     To switch sessions: Log out → Click gear icon at login → Select session

     ┌─────────────────────────────────────────────────────────────────┐
     │ Useful Commands                                                  │
     └─────────────────────────────────────────────────────────────────┘

       fastfetch            Display system information
       btop                 Interactive process viewer
       lazygit              Terminal UI for git
       lazydocker           Terminal UI for docker

     ┌─────────────────────────────────────────────────────────────────┐
     │ Support & Documentation                                          │
     └─────────────────────────────────────────────────────────────────┘

       Aura:  https://github.com/CjLogic/Aura
       Arch Wiki:  https://wiki.archlinux.org

     Enjoy your beautiful new desktop environment! ✨

EOF
