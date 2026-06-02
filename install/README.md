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

sudo id
uid=0(root) gid=0(root) groups=0(root)
```

* create an installer by $pkgr, for example `apt`: `cp _template.apt.fish claude.apt.fish`

* modify the installer with $cmd specifics

You can have several installers for the same platform, e.g. `claude.{apt,cargo,binstall,eget,mise}.fish`. You can even use them call on
the same platform; you'll just have $cmd installed in multiple locations. Generally the tradeoff is convenience (`apt`, `dnf`, `brew`) vs "age". The platform packages (`apt`, `dnf`) versions are generally older.



