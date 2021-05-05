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
alias tree="tree --charset='-' -C"
alias proj="cd ~/projects"

# Raspberry Pi Specific
alias temp='sed "s/\(...\)$/.\1°C/" < /sys/class/thermal/thermal_zone0/temp'
alias reload='sudo /etc/init.d/nginx reload'
alias nodered='cd /home/pi/node-red ; node --max-old-space-size=128 red.js'

# Add an "alert" alias for long running commands. Will send notification to desktop.
# Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

