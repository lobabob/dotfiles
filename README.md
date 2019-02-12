# Dotfiles

Custom configs for my \*nix systems.

The installation is managed by [GNU Stow](https://www.gnu.org/software/stow/). Realized I was basically just reimplementing this anyways, so used Stow instead for a more robust solution ;)

**_Note:_** If you want to use this, I'd recommend you **fork the repo and adjust the config as needed**. At the very least, modify `git/.gitconfig` with your info. This repo could change or disappear at any time, as I'm the main target. Fork this repo so you can have control over your own configs.

## Usage

With no packages specifed, all packages will be (un)installed by default. Specifying packages will (un)install only those packages. (Un)installs are idempotent. 

Under the hood, everything is being symlinked so updates are as simple as `git pull`. If there are any conflicts during installation, conflicting files are automatically backed up to `repo/_backup`.

Uninstalling a package will auto-restore any backup dotfiles that exist for that package. If you don't care about restoring potential backups, you can also manually uninstall with Stow directly, but I wouldn't recommend that.

```bash
# See a super helpful help screen
./setup --help

# Install packages
./setup               # all packages
./setup --no-scripts  # all packages and don't execute any package specific install scripts
./setup bash vim      # only bash and vim packages

# Uninstall packages
./setup --uninstall   # all packages
./setup -u bash vim   # only bash and vim packages
```

#### How to add a new package

Base level folder is your package. All the dotfiles that belong to that package go in that folder. Complex layouts are supported (e.g. a package needing dotfiles in `~/.local/share`). Include an executable `setup_` script in the base of your package if you want to run some package specific script on install.

Directory names that start with `_` are reserved for use by the setup script.

Files that end in `_` are executed by the setup script

```
# Simple example
repo/
 └─ bash
    ├─ .bash_profile
    ├─ .bash_aliases
    └─ .bashrc

# Complex example
repo/
 └─ fake_package
    ├─ .config
    |   └─ some_config_file
    ├─ .local
    |   └─ share
    |      └─ some_other_config_file
    ├─ setup_
    └─ .yet_another_config_file
```

## But why though?

Why do it this way instead of throwing everything in the root of the repo and symlinking everything to the home directory?

That would work, but eventually you have a ton of dotfiles in a disorganized mess. Separating them by a config package name is much easier to work with and manage. Especially as the number of dotfiles continues to grow. Additionally, this structure makes it easier to selectively install, uninstall, backup, and restore subsets of the existing dotfiles.

