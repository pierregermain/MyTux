#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#Drupal Autocompletion
source "$HOME/.console/console.rc" 2>/dev/null

# Commands to be executed before the prompt is displayed
# Save current working dir
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
# Change to saved working dir
#[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"

# Prompt
# If id command returns zero, you have root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\e[0;31m[\u@\h \W]\$ \e[m "
else # normal
  PS1="[\W] "
fi

# Set Keyboard
setxkbmap us -variant altgr-intl

# Basename PWD in xfce4-terminal title
#export PROMPT_COMMAND='echo -ne "\033]0;* ${PWD##*/} *\007"'

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
export MyHome_Bck=$MyUsbMnt/HOME_Bck
export MyLin_Bck=$MyUsbMnt/LIN_Bck
export MyLin2_Bck=$MyUsbMnt/LIN2_Bck

# My Aliases
source $HOME/Scripts/shell_aliases
source $MyData/PIERRE/Scripts/shell_aliases

# My Scripts
export PATH=$PATH:$HOME/Scripts
export PATH=$PATH:$HOME/Scripts/backup
export PATH=$PATH:$MyData/PIERRE/Scripts
export PATH=$PATH:$MyData/PIERRE/Scripts/DevOps

# History
HISTSIZE=4999
HISTFILESIZE=9999

# EDITOR
export VISUAL=vim
export EDITOR="$VISUAL"

#COMPOSER
export COMPOSER_HOME=$HOME/composer/home
export COMPOSER_CACHE=$HOME/composer/cache
