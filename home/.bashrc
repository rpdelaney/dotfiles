#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
[[ -z "$PS1" ]] && return

#
# ENVIRONMENT
#
    # editor
if type vim &> /dev/null; then
  export EDITOR="vim"
fi
if type gvim &> /dev/null; then
  export VISUAL="gvim"
fi
    # gpg
if type gpg &> /dev/null; then
  export GPG_TTY=`tty`
  if type pass &> /dev/null; then
    export PASSWORD_STORE_KEY="0D98863B4E1D07B6"
  fi
fi
    # mutt
if type mutt &> /dev/null; then
  export PGPPATH="~/.gnupg/"
  export MAILDIR="/var/mail/"
  export TMPDIR="/tmp/"
fi
    # git
if type git &> /dev/null; then
  export GIT_EXTERNAL_DIFF="vimdiff"
  export GITHUB_USER="rpdelaney"
  #export GITHUB_PASSWORD="$(pass show github.com)"
fi
    # lynx
if type lynx &> /dev/null; then
  export LYNX_CFG="/home/ryan/.config/lynx/config"
# export http_proxy="http://localhost:9050/"
# export ftp_proxy="http://localhost:9050/"
# export gopher_proxy="http://localhost:9050/"
fi
    # yaourt colors
if type yaourt &> /dev/null; then
  export YAOURT_COLORS="pkg=1:ver=0:lver=1;37:orphan=31:dsc:0:installed=43m:votes=36:testing=1;30m;41m:core=1;31:extra=1;32:community=1;33:local=1;44m:aur=1;35"
fi
    # Add ~/bin and all subdirectories recursively to $PATH
PATH="${PATH}:${HOME}/bin/"
for dir in find ~/bin -type d -not -path "*/.git/*" -not -name ".git"; do [[ -d $dir ]] && PATH=${dir%/}:"$PATH" ; done

#
# KEYCHAIN
#
  # ask if we want to run a new ssh-agent for this session
if type keychain &> /dev/null; then
    keychain --nogui -q
    [[ -f ~/.keychain/"$HOSTNAME"-sh ]]      && source ~/.keychain/"$HOSTNAME"-sh
    [[ -f ~/.keychain/"$HOSTNAME"-sh-gpg ]]  && source ~/.keychain/"$HOSTNAME"-sh-gpg
#elif [[ -z "$SSH_AUTH_SOCK" ]]; then
else
    timeout --foreground 2s confirm "keychain(1) not found. initialize ssh-agent?" \
    && eval $(ssh-agent)                                                           \
    && ssh-add -t 6h ~/.ssh/id_rsa
fi

#
# HISTORY
#
  # append to the history file, don't overwrite it
shopt -s histappend
  # don't put duplicate lines in the history. See bash(1) for more options
  # ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=1000
  # Ignore some controlling instructions
  # HISTIGNORE is a colon-delimited list of patterns which should be excluded.
  # The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:lss:lssa:lsa:.:dir:whereami:ranger:history'

#
#   COLORS
#
  # colorize the terminal
  # read in dircolors; enable color support
[[ -e "${HOME}"/.bash_colors ]] && eval $(dircolors -b "${HOME}"/.bash_colors) || eval $(dircolors -b)
[[ -e "${HOME}"/.bash_styles ]] && source "${HOME}"/.bash_styles
  #zenburn theme for tty
  #by way of http://phraktured.net/linux-console-colors.html
if [[ "$TERM" = "linux" ]]; then
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
else
        # If we're running in screen then use colors anyway
    [[ "$TERM" = "screen" ]] && TERM="screen-256color"
    [[ "$TERM" = "screen-bce" ]] && TERM="screen-256color-bce"
fi

#
#   PROMPT
#
if [[ -f ~/.bash_prompt ]]; then
      # If we are root, try to make that hard to miss.
      # And de-emphasize git status (we don't work as root)
  if [[ "$UID" == 0 ]]; then
    PROMPT_USER_COLOR="$(tput bold)$(tput setab 196)$(tput setaf 0)"
    PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  fi
      # If we are wheel, try to make that hard to miss.
      # And de-emphasize git status (we don't work as superuser)
  if groups | grep -q wheel; then
    PROMPT_USER_COLOR="$(tput bold)$(tput setab 11)$(tput setaf 0)"
    PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  fi
  source ~/.bash_prompt
fi

#
#   ALIASES
#
  # Alias definitions.
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
  #chdir
[[ -f ~/bin/chdir ]] && source ~/bin/chdir 1> /dev/null
  # Functions
[[ -f "${HOME}/.bash_functions" ]] && source "${HOME}/.bash_functions"
  # make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
  # additional configuration options for when running in cygwin
[[ -f "${HOME}/.bash_cygwin" ]] && source "${HOME}/.bash_cygwin"

#
# SHELL OPTIONS
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
  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Umask
#
  # /etc/profile sets 022, removing write perms to group + others.
  # Set a more restrictive umask: i.e. no exec perms for others:
  # umask 027
  # Paranoid: neither group nor others have any perms:
umask 077
#
# PRIVATE
#
  # private stuff not to be cloned to public repositories / backups
[[ -f ~/.bash_private ]] && source ~/.bash_private

#
# Greeting
#
type alsi &> /dev/null && timeout 1 alsi || echo "TERM is $TERM"
