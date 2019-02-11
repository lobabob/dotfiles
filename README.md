# Dotfiles

Custom configs for my \*nix systems.

The installation is managed by [GNU Stow](https://www.gnu.org/software/stow/). Realized I was basically just reimplementing this anyways, so used Stow instead for a more robust solution ;)

**_Note:_** If you want to use this, I'd recommend you **fork the repo and adjust the config as needed**. At the very least, modify `git/.gitconfig` with your info. This repo could change or disappear at any time, as I'm the main target. Fork this repo so you can have control over your own configs.

## Usage

#### Install configurations

By default, all the configurations present in the repo will be installed. A subset of the config packages can be installed if their names are provided to the setup script.

Everything is installed via symlinking. So if there are any new changes in the repo, you can just do a `git pull` and the updates will be reflected in all install locations.

If there are any conflicts during the process (e.g. default .bashrc already exists in home directory), conflicting files are moved to a backup directory created within the repo (`~/.dotfiles/_backup/`).

```bash
git clone https://github.com/lobabob/dotfiles.git ~/.dotfiles
~/.dotfiles/setup

# Or if you want to install specific config packages.
~/.dotfiles/setup vim tmux
```

#### Uninstall configurations

This will remove all symlinks that were created during the install process and restore any files that were moved to backup in the case of a conflict during the initial install phase. E.g. uninstalling the bash package would restore the original default `.bashrc` file that existed before the install ever happened.

```bash
~/.dotfiles/setup --uninstall

# Or to uninstall specific config packages
~/.dotfiles/setup --uninstall vim tmux
```

If you don't care about restoring potential backups, you can also manually uninstall with Stow directly

```
cd ~/.dotfiles
stow -D vim
```

#### How to add a new package

Create a base level folder to encompass a set of dotfiles and place your dotfiles in it. Basically, everything present in the config package is merged with the home directory. Directory names that start with `_` are reserved for use by the setup script.

Some Examples
```bash
# Simple example
.dotfiles/
 └─ bash
    ├─ .bash_profile
    ├─ .bash_aliases
    └─ .bashrc

# Complex example for some random app called fakeapp
.dotfiles/
 └─ fakeapp
    ├─ .config
    |   └─ some_other_config_file
    ├─ .local
    |   └─ share
    |      └─ some_other_config_file
    └─ .fakeapp
```

Why do it this way instead of throwing everything in the root of the repo? That would work, but eventually you have a ton of dotfiles in a disorganized mess. Separating them by a config package name is much easier to work with and manage. Especially as the number of dotfiles continues to grow.

