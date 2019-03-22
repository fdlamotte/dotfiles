# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=~/bin:$PATH
#export TEXINPUTS=.:~/texinputs

export QUARTUS_ROOTDIR=/opt/altera/13.0/quartus

export BITS=32

alias ls='ls --color=auto'
alias ll='ls -lh'
alias grep='grep --color=auto'

export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1           # '*'=unstaged, '+'=staged
#export GIT_PS1_SHOWSTASHSTATE=1           # '$'=stashed
#export GIT_PS1_SHOWUNTRACKEDFILES=1       # '%'=untracked
#export GIT_PS1_SHOWUPSTREAM="verbose"     # 'u='=no difference, 'u+1'=ahead by 1 commit
#export GIT_PS1_STATESEPARATOR=''          # No space between branch and index status
#export GIT_PS1_DESCRIBE_STYLE="describe"  # detached HEAD style:
export GIT_PS1_SHOWCOLORHINTS=1
export PS1='\[\033[0;33m\][${debian_chroot:+($debian_chroot)}\u@\h:\w]\[\033[0;32m$(__git_ps1)\033[0;33m\n$(if [[ $? != 0 ]]; then echo "\[\033[1;31m\]";fi)$\[\033[0m\] '

#
# Color related options
#
#set cursor to orange
printf %b '\e]12;orange\a'

source ~/bash_color_templates/base16-florent.sh

#fzf colors
export FZF_DEFAULT_OPTS="
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
"

# Commented out, dont overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac


# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# if the command-not-found package is installed, use it
if [ -x /usr/bin/command-not-found ]; then
	function command_not_found_handle {
                /usr/bin/command-not-found $1
                return $?
	}
fi

echo -e "\033[0;32m"
fortune
echo -e "\033[0m\n"


