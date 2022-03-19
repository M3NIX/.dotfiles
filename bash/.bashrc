#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# history size
HISTFILESIZE=1000000
HISTSIZE=1000000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# auto "cd" when entering just a path
shopt -s autocd

# style bash prompt and add git banch name
export PS1="\[\$(if [ \$? == 0 ]; then echo -e \"\\e[0;92m\"; else echo -e \"\\e[0;91m\"; fi)\]●\[\e[0m\] \[\e[0;34m\][\u@\h: \w]\[\e[0m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\] $ "

# set title to current directory
PROMPT_COMMAND='echo -ne "${TTY}\\033]0; ${PWD}\007"'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# load color scheme
if [ -f ~/.bash_theme ]; then
    . ~/.bash_theme
fi

# load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

