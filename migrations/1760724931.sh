echo "Change to openai-codex instead of openai-codex-bin"

if aura-pkg-present openai-codex-bin; then
    aura-pkg-drop openai-codex-bin
    aura-pkg-add openai-codex
fi
