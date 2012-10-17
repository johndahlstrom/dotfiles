[ -z "$PS1" ] && return


GREEN='\e[0;32m'
GREY='\e[1;30m'
CYAN='\e[1;36m'
WHITE='\e[0;37m'
RED='\e[0;31m'
CLEAR='\e[0m'

PS1=$RED'\[@\w\]: '$CLEAR

alias vi='vim'
alias ..='cd ..'
alias ls='ls --color=auto'
alias less='less -XF'
alias exit='clear; exit'
alias fire='sudo ufw status verbose'

alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h 0'

# Pacman
alias pacman='sudo pacman-color'
alias pacupd='sudo pacman-color -Syu'
alias pacrem='sudo pacman-color -Rns'
alias pacins='sudo pacman-color -S'
alias pacsea='sudo pacman-color -Ss'
alias paclis='sudo pacman-color -Qqet | less'
alias paclisa='sudo pacman-color -Q | less'

# Extract Files
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.xz)        unxz $1        ;;
      *.exe)       cabextract $1  ;;
      *)           echo "\`$1': unrecognized file compression." ;;
    esac
  else
    echo "\`$1' is not a valid file."
  fi
}

# Start tmux with support for 256 colors
alias tmux='tmux -2'
alias tm='tmux attach || tmux new'


# Encode video to .avi format with mp3 sound and libvcodec video codec
encode() {
  if [ -f $1 ] ; then
    if [ -z $2 ] ; then
      echo 'You need to specify a name for the output file.'
    else
      mencoder $1 -o $2.avi -oac mp3lame -ovc lavc
    fi
  else
    echo $1' is not a valid file.'
  fi
}
