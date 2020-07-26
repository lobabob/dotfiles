case $- in
    *i*) ;;
      *) return;;
esac

# ----------------
# Functions
# ----------------

if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# ----------------
# Shell Settings
# ----------------

export VISUAL=vim
export EDITOR="$VISUAL"

TERM=xterm-256color
force_color_prompt=yes
color_prompt=yes
mesg no

# https://github.com/Microsoft/WSL/issues/352
if [ "$(umask)" = "0000" ]; then
  if [ $EUID -eq 0 ];then
    umask 022
  else
    umask 002
  fi
fi

# Enable vi editing mode in bash
set -o vi

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ----------------
# Shell Prompt
# ----------------

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi


if [ $EUID -eq 0 ]; then
  prompt="#"
else
  prompt="$"
fi

if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}"

  if [ $EUID -eq 0 ]; then
    PS1="$PS1\[\033[00;31m\]\u"
  else
    PS1="$PS1\[\033[00;32m\]\u"
  fi

  PS1="$PS1@\h\[\033[00;33m\]:\W\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $prompt \[\033[00m\]"
else
  PS1="${debian_chroot:+($debian_chroot)}\u:\W\$(parse_git_branch) $prompt "
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# ----------------
# Shell Theme
# ----------------

# Base16 Shell Themes
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

# Load custom dircolors if a theme hasn't been set
if [ -z "$BASE16_THEME" ]; then
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  fi
# If there is a theme, OTHER_WRITABLE dirs need to have normal dir colors # or they'll be unreadable on WSL
elif [[ $(get_platform) == WSL ]]; then
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors.wsl && eval "$(dircolors -b ~/.dircolors.wsl)" || eval "$(dircolors -b)"
  fi
fi

# ----------------
# Alias definitions
# ----------------

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases.extra ]; then
  . ~/.bash_aliases.extra
fi

if [[ "$(uname -s)" == Darwin ]] && [ -f ~/.bash_aliases.osx ]; then
  . ~/.bash_aliases.osx
fi

# ----------------
# Autocomplete Scripts
# ----------------

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# ----------------
# PATH Modifications
# ----------------

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

