#!/usr/bin/env -S sudo fish

source (path dirname (status current-filename))/installers.source.fish
# apt [--key=] [--repo=] [--pockets=p0:p1...] pkg...
apt $argv (basename)


