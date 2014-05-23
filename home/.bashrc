#!/usr/bin/env bash
# GNU bash, version 4.2.45(2)-release (x86_64-unknown-linux-gnu)
#
# © Copyright 2014 Ryan Delaney. All rights reserved.
# <ryan delaney gmail com> OpenGPG: 0D98863B4E1D07B6
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# "$HOME"/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
[[ -z "$PS1" ]] && return

# PROMPT {{{1
  # PS1 {{{2
if [[ -f "$HOME"/.bash_prompt ]]; then
  if [[ "$UID" == 0 ]]; then
    # If we are root, try to make that hard to miss.
    # And de-emphasize git status (we don't work as root)
    PROMPT_USER_COLOR="$(tput bold)$(tput setab 196)$(tput setaf 0)"
    PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  elif groups "$USER" | grep -qP '( wheel\b| admin\b| sysop\b)'; then
    # If we are wheel, try to make that hard to miss.
    # And de-emphasize git status (we don't work as superuser)
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
  # 2}}}
  # PS2 {{{2
  # Continuation prompt
  # Default: '> '
PS2="... "
  # 2}}}
  # PS3 {{{2
  # Option select prompt
  # Default: '#?'
PS3='#?'
  # 2}}}
  # PS4 {{{2
  # Script debug mode prefix
  # Default: '+'
PS4="    +++"
  # 2}}}
# 1}}}
# ENVIRONMENT {{{1
# XDG {{{2
  # Because lots of apps are dumb and don't use the defaults like they should
  #
  # defines the base directory relative to which user specific configuration
  # files should be stored. If $XDG_CONFIG_HOME is either not set or empty, a
  # default equal to $HOME/.config should be used.
export XDG_CONFIG_HOME="$HOME/.config/"
  # defines the base directory relative to which user specific data files
  # should be stored. If $XDG_DATA_HOME is either not set or empty, a default
  # equal to $HOME/.local/share should be used.
export XDG_DATA_HOME="$HOME/.local/share"
  # defines the preference-ordered set of base directories to search for data
  # files in addition to the $XDG_DATA_HOME base directory. The directories in
  # $XDG_DATA_DIRS should be seperated with a colon ':'. If $XDG_DATA_DIRS is
  # either not set or empty, a value equal to /usr/local/share/:/usr/share/
  # should be used.
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
  # defines the base directory relative to which user specific non-essential
  # data files should be stored. If $XDG_CACHE_HOME is either not set or
  # empty, a default equal to $HOME/.cache should be used.
export XDG_CACHE_HOME="$HOME/.cache/"
  # defines the base directory relative to which user-specific non-essential
  # runtime files and other file objects (such as sockets, named pipes, ...)
  # should be stored. The directory MUST be owned by the user, and he MUST be
  # the only one having read and write access to it. Its Unix access mode MUST
  # be 0700.
#export XDG_RUNTIME_DIR=""
# }}}
# PATH {{{2
  # Add "$HOME"/bin and all subdirectories recursively to $PATH
PATH="${PATH}:$HOME/bin/"
for dir in find "$HOME"/bin -type d -not -path "*/.git/*" -not -name ".git"; do
  [[ -d $dir ]] && PATH=${dir%/}:"$PATH"
done
# }}}
# SHELL OPTIONS {{{2
#
# SHOPT {{{3
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
# }}}
# UMASK {{{3
  # /etc/profile sets 022, removing write perms to group + others.
  # Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
  # Paranoid: neither group nor others have any perms:
umask 077
# }}}
# HISTORY {{{3
  # append to the history file, don't overwrite it
shopt -s histappend
  # don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=1000
  # Ignore some controlling instructions
  # HISTIGNORE is a colon-delimited list of patterns which should be excluded.
  # The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:l:la:ls:lss:lssa:lsa:.:..:....:dir:whereami:ranger:his(tory)?'
# }}}
# }}}
# EDITOR {{{2
if type vim &> /dev/null; then export EDITOR="vim" && export VISUAL="vim"; fi
# }}}
# DISPLAY {{{2
  # If we are connected remotely, then don't assign a value to DISPLAY
if [[ -n "$SSH_CONNECTION" ]]; then
  :
#   unset DISPLAY
  # Otherwise, set-up the display environment
  else
  # GVIM
  if type gvim &> /dev/null; then export VISUAL="gvim"; fi
  # NVIDIA {{{3
    export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/.nvidia"
  # Setting the environment variable __GL_SYNC_TO_VBLANK to a non-zero value
  # will force glXSwapBuffers to sync to your monitor's vertical refresh
  # (perform a swap only during the vertical blanking period).
    export __GL_SYNC_TO_VBLANK="0"
  # When using __GL_SYNC_TO_VBLANK with TwinView, OpenGL can only sync to one
  # of the display devices; this may cause tearing corruption on the display
  #  device to which OpenGL is not syncing. You can use the environment variable
  # __GL_SYNC_DISPLAY_DEVICE to specify to which display device OpenGL should
  # sync. You should set this environment variable to the name of a display
  # device; for example "CRT-1". Look for the line "Connected display
  # device(s):" in your X log file for a list of the display devices present
  # and their names. You may also find it useful to review Chapter 13,
  # Configuring TwinView "Configuring Twinview" and the section on Ensuring
  # Identical Mode Timings in Chapter 19, Programming Modes.
  # export __GL_SYNC_DISPLAY_DEVICE=""
  # }}}
fi
# }}}
# PAGER {{{2
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
# }}}
# GPG {{{2
if type gpg &> /dev/null; then
    # Remember the current tty (so we don't bleed permissions?)
  export GPG_TTY=`tty`
    # If XDG-config-dir exists, use it
  if [[ -d "$HOME/.config/gnupg/" ]]; then export GNUPGHOME="$HOME/.config/gnupg/"; fi
fi
  # Don't ask which gpg key to use with the pass store; use this one
if type pass &> /dev/null; then export PASSWORD_STORE_KEY="0D98863B4E1D07B6"; fi
# }}}
# MUTT {{{2
if type mutt &> /dev/null; then
  export PGPPATH="$HOME$GNUPGHOME"
  export MAILDIR="/var/mail/"
  export TMPDIR="/tmp/"
fi
# }}}
# GIT {{{2
if type git &> /dev/null; then
    # git(hub) {{{3
  if type hub &> /dev/null; then
    alias git='hub'
    export GITHUB_USER="rpdelaney"
#   export GITHUB_PASSWORD="$(pass show github.com)"
  fi
    # }}}
    # TIG {{{3
  if type tig &> /dev/null; then
  #         Path of the user configuration file (defaults to ~/.tigrc).
    TIGRC_USER="$HOME/.config/tig/config"
  #         Path of the system wide configuration file (defaults to {sysconfdir}/tigrc).
  # TIGRC_SYSTEM
  #         Set command for retrieving all repository references. The command should output data in the same format as git-ls-remote(1).
  # TIG_LS_REMOTE
  #         The diff options to use in the diff view. The diff view uses git-show(1) for formatting and always passes --patch-with-stat. You may also set
  #         the diff-options setting in your tigrc(5).
    TIG_DIFF_OPTS="-y"
  #         Path for trace file where information about Git commands are logged.
  # TIG_TRACE
  fi
    # }}}
# XDG-git {{{3
  if [[ -f "$HOME/.config/git/config" ]]; then export GIT_CONFIG="$HOME/.config/git/config"; fi
    # Always vim to edit even if I have a window manager.
  export GIT_EDITOR="vim"
    # Number of context lines shown in a diff
#   export GIT_DIFF_OPTS=
    # Use vimdiff for git diff
  export GIT_EXTERNAL_DIFF="vimdiff"
    # Stop searching here when trying to find git repos
# export GIT_CEILING_DIRECTORIES=""
    # Search for repos across filesystems. I like my symlinks
  export GIT_DISCOVER_ACROSS_FILESYSTEM="1"
    # Don't automatically add "glob" magic to all pathspecs
  export GIT_GLOB_PATHSPECS="0"
  export GIT_NOGLOB_PATHSPECS="1"
    # Passwords
# export GIT_ASKPASS=""
fi
# }}}
# }}}
# LYNX {{{2
if type lynx &> /dev/null; then
  export LYNX_CFG="$HOME/.config/lynx/config"
# these settings don't just affect lynx, unfortunately.
# http_proxy causes ALL http requests to be filtered through tor. :(
# export WWW_HOME=""
# export http_proxy="http://localhost:9050/"
# export ftp_proxy="http://localhost:9050/"
# export gopher_proxy="http://localhost:9050/"
fi
# }}}
# YAOURT {{{2
if type yaourt &> /dev/null; then
  export YAOURT_COLORS="pkg=1:ver=0:lver=1;37:orphan=31:dsc:0:installed=43m:votes=36:testing=1;30m;41m:core=1;31:extra=1;32:community=1;33:local=1;44m:aur=1;35"
fi
# }}}
# SSH {{{
# If:
#   there is at least one tmux session,
if tmux has-session; then
  # and:
  #     we are connected remotely,
  if [[ -n "$SSH_CONNECTION" ]]; then
    # and:
    #     we aren't attached to tmux yet,
    if [[ -z "$TMUX" ]]; then
      # then:
      #      propagate the environment settings to tmux
      for session in $(tmux list-sessions -F "#S"); do
        tmux set-environment -g DISPLAY "$DISPLAY"
        tmux set-environment -g SSH_TTY "$SSH_TTY"
        tmux set-environment -g SSH_CONNECTION "$SSH_CONNECTION"
        tmux set-environment -t "$session" DISPLAY "$DISPLAY"
        tmux set-environment -t "$session" SSH_TTY "$SSH_TTY"
        tmux set-environment -t "$session" SSH_CONNECTION "$SSH_CONNECTION"
      done
    fi
  # else if:
  #   we are not connected remotely,
  else
    # then:
    # purge ssh environment settings from tmux
    for session in $(tmux list-sessions -F "#S"); do
      tmux set-environment -g -u DISPLAY
      tmux set-environment -g -u SSH_TTY
      tmux set-environment -g -u SSH_CONNECTION
      tmux set-environment -t "$session" -u DISPLAY
      tmux set-environment -t "$session" -u SSH_TTY
      tmux set-environment -t "$session" -u SSH_CONNECTION
    done
    :
  fi
fi
# }}}
# KEYCHAIN {{{1
#
  # determine if we want to run a new ssh-agent for this session
if type keychain &> /dev/null; then
  keychain --nogui -q
  [[ -f "$HOME"/.keychain/"$HOSTNAME"-sh ]]      && source "$HOME"/.keychain/"$HOSTNAME"-sh
  [[ -f "$HOME"/.keychain/"$HOSTNAME"-sh-gpg ]]  && source "$HOME"/.keychain/"$HOSTNAME"-sh-gpg
else
  echo "keychain(1) not found."
  if type ssh-agent &> /dev/null; then
    if timeout --foreground 2s confirm "keychain(1) not found. initialize ssh-agent?"; then
       eval "$(ssh-agent)" \
       ssh-add -t 8h "$HOME/.ssh/id_rsa"
    fi
  fi
fi
# }}}
# COLORS {{{1
#
# terminal {{{2
# read in dircolors; enable color support
[[ -e "$HOME"/.bash_colors ]] && eval $(dircolors -b "$HOME"/.bash_colors) || eval $(dircolors -b)
[[ -e "$HOME"/.bash_styles ]] && source "$HOME"/.bash_styles
# }}}
# tty {{{2
  # zenburn theme for tty by way of http://phraktured.net/linux-console-colors.html
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
# }}}
# }}}
# ALIASES {{{1
#
  # Alias definitions.
[[ -f "$HOME"/.bash_aliases ]] && source "$HOME"/.bash_aliases
  # chdir
[[ -f "$HOME"/bin/chdir ]] && source "$HOME"/bin/chdir 1> /dev/null
  # Functions
[[ -f "$HOME/.bash_functions" ]] && source "$HOME/.bash_functions"
  # make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
  # additional configuration options for when running in cygwin
[[ -f "$HOME/.bash_cygwin" ]] && source "$HOME/.bash_cygwin"
# }}}
# PRIVATE {{{1
#
  # private stuff not to be cloned to public repositories / backups
[[ -f "$HOME"/.bash_private ]] && source "$HOME"/.bash_private
# }}}
# GREETING {{{1
#
type alsi &> /dev/null && timeout 1 alsi 2> /dev/null || echo "TERM is $TERM"
# }}}

# vim: ft=sh foldmethod=marker
