# Dotfiles

This repo contains my dotfiles for my homedir, and some special scripts to make setting up things a snap.

## Features

- Includes [Oh My Zsh](http://ohmyz.sh/)
- "Role" based setup (more below)
- Installs dotfiles into your homedir, runs scripts in `dotfiles/` directory
- Installs Python packages via pip requirements file
- Includes `bin/mako` script for rendering templates (example: `.gitconfig`) on install
- Includes a `push_changes.zsh` script for installing an exported copy of this repo on another environment (note: it does an export, so the destination is NOT a git repo)

## Installation

Install on your main machine with:

```bash
$ git clone THIS_REPO ~/.home
$ cd ~/.home && ./install.zsh
```

Install on a remote machine with:

```bash
$ cd ~/.home
$ ./push_changes.zsh HOSTNAME
$ ssh HOSTNAME "cd ./.home && ./install.zsh"
```

### Requirements

- sudo
- Python headers (for compiling Fabric dependencies [paramiko])
- zsh, duh

## Roles

You can customize the shell setup based on a loose concept of "roles". Simply put the hostname of the machine in a file in the `roles/` directory, and then add a `.zsh` file with the same name as the file in `zsh/` with your custom setup. That zsh file will be sourced when `common.zsh` loads.

## Development

Use [docker](http://docker.io)!

```bash
$ docker-compose shell run
```

This will drop you into /root, this repo will be in `/root/.home`. Run `cd /root/.home && ./install.zsh` to set up and test things.