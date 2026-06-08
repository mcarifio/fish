# mise
# symlink ~/.config/fish/conf.d/mise.fish iff (command --quiet direnv)

mise use --quiet --yes --global usage
fish_add_path (mise bin-paths)


