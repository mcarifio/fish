#!/usr/bin/env fish

# run this once (or periodically) to set the $USER's fish enviroment


# turn off initial greeting
set --universal fish_greeting

set --universal --export fish_user_paths
fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin ~/.config/*/bin ~/opt/*/current/bin

# cargo
if test -d ~/.cargo
    fish_add_path ~/.cargo
end

# golang
if command --query go
   fish_add_path ~/go/bin
end
   

# mise
if command --query mise
    mise use --global usage
    fish_add_path (mise bin-paths)
end

# uv
if command --query uv
    fish_add_path (uv tool dir --bin)
end

# python
if command --query python
   fish_add_path (python -m site --user-base)/bin
end





