# Dotfiles [![CI test and build status](https://github.com/jdlabelle/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/jdlabelle/dotfiles/actions/workflows/ci.yml)

My personal dotfiles that I am improving over time. Sticking to Vim 8.0's built-in package management system, and using git submodules to manage my plugins and dependencies. I have moved to Neovim, but I keep a base vim configuration on standby. See my `nvim` repo for my Neovim configuration.

I am using [dotbot](https://github.com/anishathalye/dotbot) to manage the installation of my dotfiles. I highly recommend!

Guide I based my dotfile management on [here](https://anishathalye.com/managing-your-dotfiles/).

## Usage:

1. Move the default or existing dotfiles to a backup directory.

2. Running the install script will automatically set up the symlinks. This will not overwrite existing files as configured, however, it will not succeed if there are existing files of the same name in the installation path.
```bash
$ git clone git@github.com:jdlabelle/dotfiles.git
$ cd dotfiles
$ ./install
```

3. If there are new versions of plugins available, run `git submodule update --init --remote` to upgrade to the latest version.

4. Make local customizations: create `~/.vimrc_local` or similar and add any specific changes or customizations for the local machine. This file is sourced at the end of the main config file.
