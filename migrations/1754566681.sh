echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/aura/themes/osaka-jade ]]; then
  rm -rf ~/.config/aura/themes/osaka-jade
  git -C ~/.local/share/aura checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/aura/themes/osaka-jade ~/.config/aura/themes/osaka-jade
fi
