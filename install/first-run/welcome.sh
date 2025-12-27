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
     │         IMPORTANT: Complete Aura Installation                   │
     └─────────────────────────────────────────────────────────────────┘

         You have Aura configs and ALL dependencies already installed! ✅

         To complete the installation (build aura-cli and aura-shell):

             install-aura-full

      This builds from source and installs:
         • aura-cli - Powerful CLI tools for Aura
         • aura-shell - Beautiful QuickShell-based desktop shell

      ⚡ All AUR dependencies are pre-installed from the ISO!
      ⚡ This only takes a few minutes to build and install!

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
     │ Getting Started                                                  │
     └─────────────────────────────────────────────────────────────────┘

     1. Run 'install-aura-full' to build aura-cli and aura-shell
     2. Restart Hyprland (SUPER + SHIFT + E) after installation
     3. Explore your pre-configured Hyprland setup
     4. Check ~/.config/ for all your configurations
     5. Run 'fastfetch' to see system info
     6. Run 'btop' for system monitoring

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
