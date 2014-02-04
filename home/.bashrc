#!/usr/bin/env bash
# Ryan Delaney <ryan delaney gmail com> OpenGPG: 0D98863B4E1D07B6
# "$HOME"/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
[[ -z "$PS1" ]] && return

#
#   PROMPT
#
if [[ -f "$HOME"/.bash_prompt ]]; then
    # If we are root, try to make that hard to miss.
    # And de-emphasize git status (we don't work as root)
  if [[ "$UID" == 0 ]]; then
  PROMPT_USER_COLOR="$(tput bold)$(tput setab 196)$(tput setaf 0)"
  PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
    # If we are wheel, try to make that hard to miss.
    # And de-emphasize git status (we don't work as superuser)
  elif groups "$USER" | grep -qP '(wheel|admin|sysop)'; then
  PROMPT_USER_COLOR="$(tput bold)$(tput setab 11)$(tput setaf 0)"
  PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  elif groups "$USER" | grep -qP 'sudo(er(s)?)?'; then
  # Use defaults - do nothing
  :
  else
    # Use unprivileged colorscheme
  PROMPT_USER_COLOR="$(tput setaf 2)"
  fi
  source "$HOME"/.bash_prompt
fi

#
# ENVIRONMENT
#
  # XDG
export XDG_CONFIG_HOME="$HOME/.config/"
  # editor
if type vim &> /dev/null; then
  export EDITOR="vim"
fi
if type gvim &> /dev/null; then
  export VISUAL="gvim"
fi
  # personal settings
if [[ "$USER" == "ryan" ]]; then
    # pager
  if type pager &> /dev/null; then
  export PAGER="pager"
  elif type most &> /dev/null; then
  export PAGER="most"
  export MOST_EDITOR="vim"
  export MOST_INITFILE="$HOME/.config/most/mostrc"
  elif type less &> /dev/null; then
  export PAGER="less"
  export LESSHISTSIZE="0"
  export LESSEDIT="vim"
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
  export PGPPATH=""$HOME"/.gnupg/"
  export MAILDIR="/var/mail/"
  export TMPDIR="/tmp/"
  fi
    # git
  if type git &> /dev/null; then
    # Find my config
  if [[ -f "$HOME/.config/git/config" ]]; then
    export GIT_CONFIG="$HOME/.config/git/config"
  fi
    # Always vim to edit even if I have a window manager.
  export GIT_EDITOR="vim"
    # Number of context lines shown in a diff
  # export GIT_DIFF_OPTS=
    # Use vimdiff for git diff
  export GIT_EXTERNAL_DIFF="vimdiff"
    # Stop searching here when trying to find git repos
  export GIT_CEILING_DIRECTORIES=""
    # Search for repos across filesystems. I like my symlinks
  export GIT_DISCOVER_ACROSS_FILESYSTEM="1"
    # Add "glob" magic to all pathspec
  export GIT_GLOB_PATHSPECS="1"
    # Passwords
  # export GIT_ASKPASS=""
    # github
  export GITHUB_USER="rpdelaney"
  #export GITHUB_PASSWORD="$(pass show github.com)"
  fi
    # lynx
  if type lynx &> /dev/null; then
  export LYNX_CFG="$HOME""/.config/lynx/config"
  # export WWW_HOME=""
  # export http_proxy="http://localhost:9050/"
  # export ftp_proxy="http://localhost:9050/"
  # export gopher_proxy="http://localhost:9050/"
  fi
fi
  # yaourt colors
if type yaourt &> /dev/null; then
  export YAOURT_COLORS="pkg=1:ver=0:lver=1;37:orphan=31:dsc:0:installed=43m:votes=36:testing=1;30m;41m:core=1;31:extra=1;32:community=1;33:local=1;44m:aur=1;35"
fi
  # Add "$HOME"/bin and all subdirectories recursively to $PATH
PATH="${PATH}:$HOME/bin/"
for dir in find "$HOME"/bin -type d -not -path "*/.git/*" -not -name ".git"; do [[ -d $dir ]] && PATH=${dir%/}:"$PATH" ; done

#
# KEYCHAIN
#
  # ask if we want to run a new ssh-agent for this session
if type keychain &> /dev/null; then
  keychain --nogui -q
  [[ -f "$HOME"/.keychain/"$HOSTNAME"-sh ]]      && source "$HOME"/.keychain/"$HOSTNAME"-sh
  [[ -f "$HOME"/.keychain/"$HOSTNAME"-sh-gpg ]]  && source "$HOME"/.keychain/"$HOSTNAME"-sh-gpg
#elif [[ -z "$SSH_AUTH_SOCK" ]]; then
else
  timeout --foreground 2s confirm "keychain(1) not found. initialize ssh-agent?" \
  && eval $(ssh-agent)                                                           \
  && ssh-add -t 6h "$HOME"/.ssh/id_rsa
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
[[ -e "$HOME"/.bash_colors ]] && eval $(dircolors -b "$HOME"/.bash_colors) || eval $(dircolors -b)
[[ -e "$HOME"/.bash_styles ]] && source "$HOME"/.bash_styles
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
#   ALIASES
#
  # Alias definitions.
[[ -f "$HOME"/.bash_aliases ]] && source "$HOME"/.bash_aliases
  #chdir
[[ -f "$HOME"/bin/chdir ]] && source "$HOME"/bin/chdir 1> /dev/null
  # Functions
[[ -f "$HOME/.bash_functions" ]] && source "$HOME/.bash_functions"
  # make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
  # additional configuration options for when running in cygwin
[[ -f "$HOME/.bash_cygwin" ]] && source "$HOME/.bash_cygwin"

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

#
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
[[ -f "$HOME"/.bash_private ]] && source "$HOME"/.bash_private

#
# Greeting
#
type alsi &> /dev/null && timeout 1 alsi 2> /dev/null || echo "TERM is $TERM"
