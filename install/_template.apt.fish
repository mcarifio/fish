#!/usr/bin/env -S sudo fish

test (status filename) = (status current-filename); or ret "$(status filename) should be run (as root), not sourced."

# cmd, command you want
set --local parts (string split . (status filename))
set --local cmd $parts[1]

# $pkg, the package to install; usually $cmd
set --local _flags_pkg $cmd
# set --local _flags_key "https://..."
# set --local _flags_repo "https://..."
set --local _flags_pockets stable:main

# $cmd.apt.fish [--pkg=claude-code] [--key=https://...] [--repo=https://...] [--pockets=stable:main]
argparse pkg= key= repo= pockets= -- $argv
test -n "$_flags_key"; or ret "--key=url required"
test -n "$_flags_repo"; or ret "--repo=url required"

set --local keyring /usr/share/keyrings/$_flags_pkg
curl -fsSL $_flags_key -o $keyring
echo "deb [signed-by=$keyring] $_flags_repo $(string split : $_flags_pockets)" > /etc/apt/sources.list.d/$pkg.list

apt update
apt upgrade -y
apt install -y $pkg
