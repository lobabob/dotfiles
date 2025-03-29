# ----------------
# Functions
# ----------------

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

get_platform() {
  local result

  if [[ "$(uname -s)" == Darwin ]]; then
    result="Mac"
  else
    cat /proc/version 2> /dev/null | grep -iq microsoft
    first_check=$?
    cat /proc/sys/kernel/osrelease 2> /dev/null | grep -iq microsoft
    second_check=$?

    if [ $first_check -eq 0 ] || [ $second_check -eq 0 ]; then
      result="WSL"
    else
      result="Linux"
    fi
  fi

  if [ -n "$1" ]; then
    eval "$1=$result"
  else
    echo $result
  fi
}

parse_git_branch() {
  get_platform platform
  if [[ ! $platform == WSL ]]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ⎇ [\1]/'
  else
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
  fi
}

