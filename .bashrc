# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

export TERM="screen-256color"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ls='ls --color=auto'
alias less='less -XF'
alias tm='tmux -2'
alias tmux='tmux -2'


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

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[1;33m\]'
    c_path='\[\e[0;31m\]'
    c_jobs='\[\e[0;32m\]'
    c_git_clean='\[\e[0;36m\]'
    c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

    if git diff --quiet 2>/dev/null >&2; then
        git_color="$c_git_clean"
    else
        git_color="$c_git_dirty"
    fi

    echo " [$git_color$git_branch${c_reset}]"
}

# List number of background/suspended jobs.
jobs_check () {
    jobs_count=$(jobs | wc -l)
    [[ $jobs_count -gt 0 ]] && echo " ($c_jobs$jobs_count$c_reset)"
}

# Find Mac/Windows junk and flag it.
junk_check ()
{
    junk_mark=" \[\e[1;31m\]*\[\e[0m\]"
    [[ -f ".DS_Store" ]] && echo "$junk_mark"
    [[ -f ".thumbs" ]] && echo "$junk_mark"
}

# Thy holy prompt.
PROMPT_COMMAND='PS1="\[\e[0;31m\]┌─[\t] \[\e]2;\u@\h:\w\a\]${c_path}\w${c_reset}$(git_prompt)$(jobs_check)$(junk_check)\n\[\e[0;31m\]└──\[\e[0;31m\]──╼\[\e[0m\]  "'
#PS1="\[\e[01;37m\]┌─[\t][$]: \w\[\e[01;37m\]\n\[\e[01;37m\]└──\[\e[01;37m\]──╼\[\e[0m\] "

