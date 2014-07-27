# Aliases
###########

alias ls="ls --color=auto -F --group-directories-first"
alias lsl="ls -l"
alias lsa="ls -a"
alias dir="dir --color=auto"
alias cls='clear'
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias tmux="tmux -l"
alias tree="tree --charset='-' -C"

alias fuck="fortune"
alias shit="fortune"
alias damn="fortune"
alias fuk="fortune"
alias fuc="fortune"
alias fak="fortune"

# Raspberry Pi Specific
alias temp='echo -e $(echo "scale=3; $(cat /sys/class/thermal/'\
'thermal_zone0/temp)/1000" | bc)"\u00B0C"'

