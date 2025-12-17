echo "Change aura-screenrecord to use gpu-screen-recorder"
aura-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
aura-pkg-add slurp gpu-screen-recorder
