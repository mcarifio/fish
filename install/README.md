# install scripts

## tl;dr

`install/$cmd.$pkgr.fish` where $pkgr is:

* fish; implies `curl`
* bash; implies `curl`
* brew
* apt
* dnf
* binstall (implies `cargo install cargo-binstall`)
* go
* uv
* npm
* snap
* nix
* winget
* eget
* mise

## usage

* (first time) passwordless `sudo` for convenience:

```fish
echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo install -u root -g root -m0600 /dev/stdin /etc/sudoers.d/sudo-nopasswd

sudo id ## smoketest
uid=0(root) gid=0(root) groups=0(root)
```

* create an installer by $pkgr, for example `apt`: `cp _template.apt.fish claude.apt.fish`

* modify the installer with $cmd specifics. See claude-code.apt.fish for an example.

You can have several installers for the same platform, e.g. `claude.{apt,cargo,binstall,eget,mise}.fish`. You can even use them all on
the same host; you'll just have $cmd installed in multiple locations. Generally the tradeoff is convenience (`apt`, `dnf`, `brew`) vs "recency"; platform packages (`apt`, `dnf`) versions are generally dated.




