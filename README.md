# Dotfiles [![CI test and build status](https://github.com/jdlabelle/dotfiles/actions/workflows/ci/badge.svg)](https://github.com/jdlabelle/dotfiles/actions/workflows/test.yml)

 First iteration of my personal dotfiles and slowly adding. Sticking to Vim 8.0's built-in package management system, and using git submodules to manage my plugins and dependencies. At some point I'll be giving NVIM a go.

I am using [dotbot](https://github.com/anishathalye/dotbot) to manage the installation of my dotfiles. I highly recommend!

Guide I based my dotfile management on [here](https://anishathalye.com/managing-your-dotfiles/).

## Usage:

1. Move the default or existing dotfiles to a backup directory.

2. Running the install script will automatically set up the symlinks. This will not overwrite existing files as currently configured, however, it will not succeed if there are existing files of the same name in the installation path.
```bash
$ git clone git@github.com:jdlabelle/dotfiles.git
$ cd dotfiles
$ ./install
```

3. If there are new versions of plugins available, run `git submodule update --init --remote` to upgrade to the latest version.

4. Make local customizations: create `~/.vimrc_local` or similar and add any specific changes or customizations for the local machine, they will be sourced at the end of the main config file.
