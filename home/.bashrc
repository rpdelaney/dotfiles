# ~/.bashrc: executed by bash(1) for interactive shells.

##############################################################
#   INITIALIZATION
#

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
[[ -z "$PS1" ]] && return

##############################################################
#   ENVIRONMENT
#

export EDITOR="nano"
export VISUAL="nano"

#
# Add ~/bin and all subdirectories recursively to $PATH
#
#PATH="${PATH}:$(find ${HOME}/bin -maxdepth 1 -type d | tr '\n' ':' | sed 's/:$//')"

#for dir in ~/bin/!(.git)/; do [[ -d $dir ]] && PATH=${dir%/}:$PATH; done

##############################################################
#   HISTORY

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

##############################################################
#   COLORS

# colorize the terminal
# read in dircolors; enable color support

if [ -f ~/.dir_colors ] ; then
    eval "`dircolors -b ~/.bash_colors`"
else
    eval "`dircolors -b`"
fi

#zenburn theme for tty 
#by way of http://phraktured.net/linux-console-colors.html
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear                  #for background artifacting
fi

# 
# If we're running in screen then use colors anyway
#
[ "$TERM" = "screen-bce" ] && TERM="screen-256color-bce"

##############################################################
#   PROMPT

# Based on prompt by M Alexander (storm@tux.org) found here:
# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x865.html
#
# Set up prompts. Color code them for logins. Red for root, white for 
# user logins, green for ssh sessions, cyan for telnet,
# magenta with red "(ssh)" for ssh + su, magenta for telnet.

[[ -f ~/.bash_styles ]] && source ~/.bash_styles

[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

##############################################################
#   ALIASES

# Alias definitions.
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

##############################################################
#   AUTOCOMPLETE
#
# MOVED TO ~/.inputrc
#
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
#
# make tab-completion case-insensitive
#set completion-ignore-case on
#
##############################################################
# FUNCTIONS
#
[[ -f "${HOME}/.bash_functions" ]] && source "${HOME}/.bash_functions"

##############################################################
# SHELL OPTIONS
#
# See man bash for more options...
#

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Use extended globbing
#shopt -s extglob

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:lss:lssa:lsa:whereami:ranger:history' 

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077


###################################################################
#
# cygwin
#
# additional configuration options for when running in cygwin
# 
[[ -f "${HOME}/.bash_cygwin" ]] && source "${HOME}/.bash_cygwin"

###################################################################
#
# gpg
#
GPG_TTY=`tty`
export GPG_TTY

###################################################################
# PRIVATE
# 
# private stuff not to be cloned to public repositories / backups
[[ -f ~/.bash_private ]] && source ~/.bash_private
