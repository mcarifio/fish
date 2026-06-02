#!/usr/bin/env -S sudo fish

source (path dirname (status current-filename))/installers.source.fish
# apt [--key=] [--repo=] [--pockets=p0:p1...] pkg...
apt --key="https://downloads.claude.ai/keys/claude-code.asc" \
    --repo="https://downloads.claude.ai/claude-code/apt/stable" \
    --pockets=stable:main $argv claude-code

