#!/usr/bin/env fish

# run this once (or periodically) to set the $USER's fish enviroment


# turn off initial greeting
set --universal fish_greeting

set --universal --export fish_user_paths
fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin ~/.config/*/bin ~/opt/*/current/bin /etc/fish{/dev,}/bin


# uv
if command --query uv
    fish_add_path (uv tool dir --bin)
end

# python
if command --query python
   fish_add_path (python -m site --user-base)/bin
end





