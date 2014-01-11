# Fix PATH
export PATH='/sbin:/usr/sbin:/bin:/usr/bin:/home/john/.gem/ruby/2.0.0/bin'

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/john/.zshrc'

autoload -Uz compinit
autoload -U colors && colors

compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT="%{$fg[blue]%}[%{$fg[white]%}%~%{$fg[blue]%}] %{$reset_color%}"
RPROMPT="%{$fg[blue]%}[%{$fg[white]%}%*%{$fg[blue]%}] %{$reset_color%}"

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

alias tm='tmux -2'


# Also fix a bunch of other keys
bindkey '^[[H'     beginning-of-line # <Home>
bindkey '^[[F'     end-of-line       # <End>


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

