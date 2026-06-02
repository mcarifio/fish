# direnv
# symlink ~/.config/fish/completions/direnv.fish iff (command --quiet direnv)
direnv hook (shell) | source
