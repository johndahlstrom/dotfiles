#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Aliases
alias ..='cd ..'
alias ls='ls --color=auto'
alias less='less -XF'

alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h 0'

alias pacman='sudo pacman'
alias pacupd='sudo pacman -Syu'
alias pacrem='sudo pacman -Rns'
alias pacins='sudo pacman -S'
alias pacsea='sudo pacman -Ss'
alias paclis='sudo pacman -Qqet | less'
alias paclisa='sudo pacman -Q | less'

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

# Remove all orphan packages with pacman
cleanup() {
  sudo pacman -Qqdt > cleanuplist
 
  removelist=""
  while read line; do
    removelist=$removelist" "$line
  done < "./cleanuplist"
  echo $removelist
  rm ./cleanuplist
  
  if [ -z $removelist ]; then
    echo 'There is nothing to clean.';
  else
    sudo pacman -Rs $removelist
  fi
}
