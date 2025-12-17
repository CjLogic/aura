AURA_MIGRATIONS_STATE_PATH=~/.local/state/aura/migrations
mkdir -p $AURA_MIGRATIONS_STATE_PATH

for file in ~/.local/share/aura/migrations/*.sh; do
  touch "$AURA_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
