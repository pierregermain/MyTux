# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Debug .bashrc
# set -x

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#HISTORY RELATED
HISTSIZE=9999
HISTFILESIZE=9999
HISTCONTROL=ignoreboth:erasedups # no duplicate entries
shopt -s histappend              # append to history file
export PROMPT_COMMAND="history -a"        # update histfile after every command

# WINDOWS SIZE
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    # if we are superuser
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
        PROMPT_DIRTRIM=3
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \W\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

#if [ -x /usr/bin/mint-fortune ]; then
#     /usr/bin/mint-fortune
#fi

# PWB

# X configurations
#if [ "$DISPLAY" != "" ] ; then
  # Call X clients
  setxkbmap us -variant altgr-intl
  xset -b # do not beep
  # URxvt
  #if [ -f ~/.Xresources ]; then
  #  xrdb -merge ~/.Xresources
  #fi
#fi

# Basename PWD in xfce4-terminal title
#export PROMPT_COMMAND='echo -ne "\033]0; $HOSTNAME: $PWD\007"'

# Make the terminal vi like
set -o vi

# My Maquina
export MyMaquina=`hostname`

# My Data Partition
if [ $MyMaquina = "archy" ]; then
  export MyUsbMnt=/run/media/pierre
else
  export MyUsbMnt=/media/pierre
fi

export MyData=$MyUsbMnt/DATA
export MyData_Bck=$MyUsbMnt/DATA_Bck
export MyMuz=$MyUsbMnt/MUZ
export MyMuz_Bck=$MyUsbMnt/MUZ_Bck
export MyHome_Bck=$MyUsbMnt/HOME_Bck1
export MyLin_Bck=$MyUsbMnt/Lin_Bck
export MyLin2_Bck=$MyUsbMnt/Lin2_Bck

# My Aliases
if [ -f ~/Scripts/shell_aliases ]; then
  source ~/Scripts/shell_aliases
fi
if [ -f $HOME/PIERRE/Scripts/shell_aliases ]; then
  . $HOME/PIERRE/Scripts/shell_aliases
fi
if [ -f $HOME/Scripts/shell_aliases_music ]; then
  . $HOME/Scripts/shell_aliases_music
fi
if [ -f $HOME/PIERRE/Scripts/path_aliases ]; then
  . $HOME/PIERRE/Scripts/path_aliases
fi

# Autojump
# Load autojump
if [ -f /usr/share/autojump/autojump.sh ]; then
  . /usr/share/autojump/autojump.sh
fi
if [ -f /usr/share/autojump/autojump.bash ]; then
  . /usr/share/autojump/autojump.bash
fi

# Text Editor
export EDITOR=vim
export VISUAL=vim

# TODO: Does this work for i3 ??
export TERMINAL=termite
#alias termit=termite

# Do not beep
if [ $MyMaquina = "archy" ]; then
  set bell-style none
fi

# INSENSITIVE TERMINAL COMPLETION
# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
# Add option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc


# My Scripts
export PATH=$PATH:$HOME/DATA/PIERRE/Scripts
export PATH=$PATH:$HOME/DATA/PIERRE/Scripts/DevOps
export PATH=$PATH:$HOME/Scripts
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/home/pierre/Scripts/convert-files
export PATH=$PATH:$HOME/Scripts/backup
export PATH=$PATH:$HOME/Scripts/i3

alias PS1="PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '"

export XDG_DATA_HOME=/home/pierre/.local/share/

source $HOME/Scripts/oneclick
