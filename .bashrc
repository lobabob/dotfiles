# Aliases
###########

alias ls="ls --color=auto"
alias cls='clear'
alias grep="grep --color=auto"

# Exports
###########

export EDITOR=vim

# Terminal Settings
#####################

#TERM=xterm-color
TERM=xterm-256color
force_color_prompt=yes
color_prompt=yes

# Prompt Settings
###################

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u@\h\[\033[00m\]:\w\$"
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
fi



# Functions
#############

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "Don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
