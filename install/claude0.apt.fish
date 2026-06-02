#!/usr/bin/env -S sudo fish

set --local parts (string split . (status filename))
set --local cmd $parts[1]
set --local pkg $cmd-code

set --local keyring /usr/share/keyrings/$pkg.asc
curl -fsSL https://downloads.claude.ai/keys/$pkg.asc -o $keyring
echo "deb [signed-by=$keyring] https://downloads.claude.ai/claude-code/apt/stable stable main" > /etc/apt/sources.list.d/$pkg.list
apt update
apt upgrade -y
apt install -y $pkg

