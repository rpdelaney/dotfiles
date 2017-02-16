#!/usr/bin/env bash
# GNU bash, version 4.2.45(2)-release (x86_64-unknown-linux-gnu)
#
# © Copyright 2014 Ryan Delaney. All rights reserved.
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

# SHELL OPTIONS {{{2
#
# SHOPT {{{3
#  # causes the shell to notify the user asynchronously of background job
#  # completions.
#set -b
#  # causes the shell to exit if any command exits nonzero, excepting procedural
#  # logic and subshells (see 'man set')
#set +e
#  # Don't use ^D to exit a shell: require an explicit exit command
#set -o ignoreeof
#  # Allow shell command line editing using the built-in vi editor. Enabling vi
#  # mode shall disable any other command line editing mode provided as an
#  # implementation extension.
#set -o vi
#  # The shell shall read commands but does not execute them; this can be used to
#  # check for shell script syn‐ tax errors. An interactive shell may ignore this
#  # option.
##set -o noexec
#  # The shell shall write its input to standard error as it is read.
##set -v
#  # Use case-insensitive filename globbing
#shopt -s nocaseglob
#  # Make bash append rather than overwrite the history on disk
#shopt -s histappend
#  # Use extended globbing
##shopt -s extglob
#  # When changing directory small typos can be ignored by bash for example, cd
#  # /vr/lgo/apaache would find /var/log/apache
#shopt -s cdspell
#  # check the window size after each command and, if necessary, update the
#  # values of LINES and COLUMNS.
#shopt -s checkwinsize
# }}}
# UMASK {{{3
  # /etc/profile sets 022, removing write perms to group + others.
  # Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
  # Paranoid: neither group nor others have any perms:
# umask 0077
# }}}
# HISTORY {{{3
  # append to the history file, don't overwrite it
shopt -s histappend
  # don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=80
HISTFILESIZE=50
  # Ignore some controlling instructions
  # HISTIGNORE is a colon-delimited list of patterns which should be excluded.
  # The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:fc:exit:.:whereami:ranger*:hist*'
export HISTIGNORE="$HISTIGNORE"':clear'
# }}}
# }}}
# SETTINGS {{{1
#  # Mark variables which are modified or created for export.
##set +a
#  # Notify of job termination immediately.
#set -b
#  # Exit immediately if a command exits with a non-zero status.
#set +e
#  # Disable file name generation (globbing).
#set +f
#  # Remember the location of commands as they are looked up.
#set -h
#  # All assignment arguments are placed in the environment for a
#  # command, not just those that precede the command name.
#set -k
#  # Job control is enabled.
#set -m
#  # Read commands but do not execute them.
#set +n
#  # Use a vi-style editing interface on the command line
#set -o vi
#  # Turned on whenever the real and effective user ids do not match.
#  # Disables processing of the $ENV file and importing of shell
#  # functions.  Turning this option off causes the effective uid and
#  # gid to be set to the real uid and gid.
#set +p
#  # Exit after reading and executing one command.
#set -t
#  # Treat unset variables as an error when substituting.
#set -u
#  # Print shell input lines as they are read.
#set -v
#  # Print commands and their arguments as they are executed.
#set -x
#  # the shell will perform brace expansion
#set -B
#  # If set, disallow existing regular files to be overwritten
#  # by redirection of output.
#set -C
#  # If set, the ERR trap is inherited by shell functions.
#set -E
#  # Enable ! style history substitution.  This flag is on
#  # by default when the shell is interactive.
#set -H
#  # If set, do not resolve symbolic links when executing commands
#  # such as cd which change the current directory.
#set -P
#  # If set, the DEBUG trap is inherited by shell functions.
#set -T
#  # Assign any remaining arguments to the positional parameters.
#set --
#  # If there are no remaining arguments, the positional parameters
#  # are unset.
#set -
#  # Assign any remaining arguments to the positional parameters.
#  # The -x and -v options are turned off.
## 1}}}
# ENVIRONMENT {{{1
# XDG {{{2
  # Because lots of apps are dumb and don't use the defaults like they should
  #
  # defines the base directory relative to which user specific configuration
  # files should be stored. If $XDG_CONFIG_HOME is either not set or empty, a
  # default equal to $HOME/.config should be used.
if [[ -d "$HOME/.config/" ]] ; then
  export XDG_CONFIG_HOME="$HOME/.config/"
else
  echo "XDG_CONFIG_HOME not found." >&2
fi
  # defines the base directory relative to which user specific data files
  # should be stored. If $XDG_DATA_HOME is either not set or empty, a default
  # equal to $HOME/.local/share should be used.
if [[ -d "$HOME/.local/share" ]] ; then
  export XDG_DATA_HOME="$HOME/.local/share"
else
  echo "XDG_DATA_HOME not found." >&2
fi
  # defines the preference-ordered set of base directories to search for data
  # files in addition to the $XDG_DATA_HOME base directory. The directories in
  # $XDG_DATA_DIRS should be seperated with a colon ':'. If $XDG_DATA_DIRS is
  # either not set or empty, a value equal to /usr/local/share/:/usr/share/
  # should be used.
if [[ -d "/usr/local/share/" ]] || [[ -d "/usr/share/" ]] ; then
  export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
else
  echo "XDG_DATA_DIRS not found." >&2
fi
  # defines the base directory relative to which user specific non-essential
  # data files should be stored. If $XDG_CACHE_HOME is either not set or
  # empty, a default equal to $HOME/.cache should be used.
if [[ -d "$HOME/.cache/" ]] ; then
  export XDG_CACHE_HOME="$HOME/.cache/"
else
  echo "XDG_CACHE_HOME not found." >&2
fi
  # defines the base directory relative to which user-specific non-essential
  # runtime files and other file objects (such as sockets, named pipes, ...)
  # should be stored. The directory MUST be owned by the user, and he MUST be
  # the only one having read and write access to it. Its Unix access mode MUST
  # be 0700.
# Test runtime directory exists
uid="$(id -u)"
if [[ -d "/run/user/$uid" ]] ; then
  # Test runtime directory is owned by us
  if [[ "$(stat -c "%u" "/run/user/$uid")" == "$uid" ]] ; then
    # Test runtime directory permissions
    if [[ "$(stat -c "%a" "/run/user/$uid")" == "700" ]] ; then
      export XDG_RUNTIME_DIR="/run/user/$uid"
    else
      echo "XDG_RUNTIME_DIR has incorrect permissions." >&2
    fi
  else
    echo "XDG_RUNTIME_DIR is not owned by UID $uid." >&2
  fi
else
  echo "XDG_RUNTIME_DIR not found." >&2
fi
# }}}
# PATH {{{2
  # Add "$HOME"/bin and all subdirectories recursively to $PATH
  # But exclude directories named .git so we don't pollute our $PATH with a bunch of irrelevant stuff
PATH="${PATH}:$HOME/bin/"
for dir in find "$HOME"/bin -type d -not -path "*/.git/*" -not -name ".git"; do
  [[ -d $dir ]] && PATH=${dir%/}:"$PATH"
done
# }}}
# TERM {{{2
  # read /etc/lsb-release for distribution name and version
if [[ -r /etc/lsb-release ]]; then
  source /etc/lsb-release
fi
  # If running urxvt in Ubuntu/debian, reset the terminal.
  # This is necessary because most debian systems don't have terminfo for
  # rxvt-unicode-256color
if [[ "$TERM" == "rxvt-unicode-256color" ]] && [[ "$DISTRIB_ID" == "Ubuntu" ]]; then
  TERM="rxvt-unicode"
fi
# 2}}}
# EDITOR {{{2
if type vim &> /dev/null; then export EDITOR="vim" && export VISUAL="vim"; fi
if type gvim &> /dev/null; then export VISUAL="gvim"; fi
# }}}
# DISPLAY {{{2
# NVIDIA {{{3
if [[ -n "$(pacman -Q nvidia 2> /dev/null)" ]]; then
  if [[ -d "$XDG_CACHE_HOME/nvidia" ]] ; then
    export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nvidia"
  else
    echo "__GL_SHADER_DISK_CACHE_PATH not found." >&2
  fi
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
fi
# NVIDIA 3}}}
# DISPLAY 2}}}
# PAGER {{{2
if type pager &> /dev/null; then
  export PAGER="pager"
elif type most &> /dev/null; then
  export PAGER="most"
  export MOST_EDITOR="vim"
  if [[ -f "$XDG_CONFIG_HOME/most/mostrc" ]] ; then
    export MOST_INITFILE="$XDG_CONFIG_HOME/most/mostrc"
  else
    echo "MOST_INITFILE not found." >&2
  fi
elif type less &> /dev/null; then
  export PAGER="less"
  export LESSHISTSIZE="0"
  export LESSEDIT="vim"
fi
# }}}
# GPG {{{2
if type gpg &> /dev/null; then
    # Remember the current tty (so we don't bleed permissions?)
  export GPG_TTY="$(tty)"
  if [[ -d "$XDG_CONFIG_HOME/gnupg/" ]] ; then
    export GNUPGHOME="$XDG_CONFIG_HOME/gnupg/"
  else
    echo "GNUPGHOME not found." >&2
  fi
fi
  # Don't ask which gpg key to use with the pass store; use this one
if type pass &> /dev/null; then
  if [[ -d "$HOME/docs/passwords/" ]] ; then
    export PASSWORD_STORE_DIR="$HOME/docs/passwords/"
  else
    if [[ -d "$HOME/.password-store" ]] ; then
      export PASSWORD_STORE_DIR="$HOME/.password-store"
    else
      echo "PASSWORD_STORE_DIR not found." >&2
    fi
  fi
  export PASSWORD_STORE_KEY="0D98863B4E1D07B6"
  export PASSWORD_STORE_CLIP_TIME="15"
  export PASSWORD_STORE_UMASK="0077"
fi
# }}}
# MAIL {{{2
  # If this parameter is set to a filename or directory name and the MAILPATH
  # variable is not set, Bash informs the user of the arrival of mail in the
  # specified file or Maildir-format directory.
if [[ -d "/var/mail/$USERNAME" ]] ; then
  export MAIL="/var/mail/$USERNAME"
else
  echo "MAIL not found." >&2
fi

  # How often (in seconds) that the shell should check for mail in the files
  # specified in the MAILPATH or MAIL variables. The default is 60 seconds. When
  # it is time to check for mail, the shell does so before displaying the primary
  # prompt. If this variable is unset, or set to a value that is not a number
  # greater than or equal to zero, the shell disables mail checking.
export MAILCHECK=60

# Mutt {{{3
if type mutt &> /dev/null; then
  if [[ -d "$GNUPGHOME" ]] ; then
    export PGPPATH="$GNUPGHOME"
  else
    echo "PGPPATH not found." >&2
  fi
  if [[ -d "/tmp/" ]] ; then
    export TMPDIR="/tmp/"
  else
    echo "TMPDIR not found." >&2
  fi
  # Full  path  of  the  user's  spool mailbox if MAIL is unset.  Commonly used
  # when the spool mailbox is a maildir (5) folder.
  if [[ -d "/var/mail/" ]] ; then
    export MAILDIR="/var/mail/"
  else
    echo "MAILDIR not found." >&2
  fi
fi
# 3}}}
# 2}}}
# GIT {{{2
if type git &> /dev/null; then
    # git(hub) {{{3
  if type hub &> /dev/null; then
    export GITHUB_USER="rpdelaney"
  fi
    # }}}
    # TIG {{{3
  if type tig &> /dev/null; then
  #         Path of the user configuration file (defaults to ~/.tigrc).
  if [[ -f "$XDG_CONFIG_HOME/tig/tigrc" ]] ; then
    export TIGRC_USER="$XDG_CONFIG_HOME/tig/tigrc"
  else
    echo "TIGRC_USER not found." >&2
  fi
  #         Path of the system wide configuration file (defaults to {sysconfdir}/tigrc).
  # TIGRC_SYSTEM
  #         Set command for retrieving all repository references. The command should output data in the same format as git-ls-remote(1).
  # TIG_LS_REMOTE
  #         The diff options to use in the diff view. The diff view uses git-show(1) for formatting and always passes --patch-with-stat. You may also set
  #         the diff-options setting in your tigrc(5).
    export TIG_DIFF_OPTS="-y"
  #         Path for trace file where information about Git commands are logged.
  # TIG_TRACE
  fi
    # }}}
# XDG-git {{{3
  if [[ ! -d "$XDG_CONFIG_HOME/git/config" ]] ; then
    export GIT_CONFIG="$XDG_CONFIG_HOME/git/config"
  else
    echo "GIT_CONFIG not found." >&2
  fi
    # Always vim to edit even if I have a window manager.
  export GIT_EDITOR="vim"
    # Number of context lines shown in a diff
# export GIT_DIFF_OPTS=
    # Use vimdiff for git diff
# export GIT_EXTERNAL_DIFF="vimdiff"
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
    # Where to find the config
  if [[ -f "$XDG_CONFIG_HOME/lynx/config" ]]; then
    export LYNX_CFG="$XDG_CONFIG_HOME/lynx/config"
  fi
    # Where to save downloaded files
  if [[ -d "$HOME/incoming/" ]]; then
    export LYNX_SAVE_SPACE="$HOME/incoming"
  else
    export LYNX_SAVE_SPACE="$HOME"
  fi
# these settings don't just affect lynx, unfortunately.
# http_proxy causes ALL http requests to be filtered through tor. :(
  export WWW_HOME="https://duckduckgo.com/"
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
# TORSOCKS {{{2
if type torsocks &> /dev/null; then
  if [[ -f "$XDG_CONFIG_HOME/torsocks/config" ]]; then
    export TORSOCKS_CONF_FILE="$XDG_CONFIG_HOME/torsocks/config"
  else
    echo "torsocks.conf not found." >&2
  fi
fi
# 2}}}
# PSQL {{{2
if type psql &> /dev/null; then
  if [[ -f "$XDG_CONFIG_HOME/psql/config" ]]; then
    export PSQLRC="$XDG_CONFIG_HOME/psql/config"
  else
    echo "PSQLRC not found." >&2
  fi
  export PSQL_EDITOR="vim"
# export PSQL_HISTORY
# export PGDATABASE
# export PGHOST
# export PGPORT
# export PGUSER
fi
# }}}
# ADB {{{2
if type adb &> /dev/null; then
    # Print debug information. A comma separated list of the following values 1 or
    # all, adb, sockets, packets, rwx, usb, sync, sysdeps, transport, jdwp
  export ADB_TRACE=""
    # The serial number to connect to. -s takes priority over this if given.
  export ANDROID_SERIAL="0146B5040401801E"
    # When used with the logcat option, only these debug tags are printed.
# export ANDROID_LOG_TAGS=
fi
# 2}}}
# WINE {{{2
if type wine &> /dev/null; then
  # Hide fixme messages. I don't do winedev
  export WINEDEBUG="fixme-all"
fi
# 2}}}
# GREP {{{2
  # If set, grep behaves as POSIX requires; otherwise, grep behaves more like
  # other GNU programs. POSIX requires that options that follow file names must
  # be treated as file names; by default, such options are permuted to the front
  # of the operand list and are treated as options. Also, POSIX requires that
  # unrecognized options be diagnosed as “illegal”, but since they are not
  # really against the law the default is to diagnose them as “invalid”.
  # POSIXLY_CORRECT also disables _N_GNU_nonoption_argv_flags_, described below.
if [[ -n "$POSIXLY_CORRECT" ]]; then
  unset POSIXLY_CORRECT
fi
  # This variable specifies default options to be placed in front of any
  # explicit options. As this causes problems when writing portable scripts,
  # this feature will be removed in a future release of grep, and grep warns if
  # it is used. Please use an alias or script instead.
if [[ -n "$GREP_OPTIONS" ]]; then
  unset GREP_OPTIONS
fi
  # This variable specifies the color used to highlight matched (non-empty)
  # text. It is deprecated in favor of GREP_COLORS, but still supported. The mt,
  # ms, and mc capabilities of GREP_COLORS have priority over it. It can only
  # specify the color used to highlight the matching non-empty text in any
  # matching line (a selected line when the -v command-line option is omitted,
  # or a context line when -v is specified). The default is 01;31, which means a
  # bold red foreground text on the terminal's default background.
export GREP_COLOR=
  # Specifies the colors and other attributes used to highlight various parts
  # of the output. See 'man grep' for details.
export GREP_COLORS=
# 2}}}
# PROMPT {{{1
  # PS1 {{{2
if [[ -f "$HOME"/.bash_prompt ]]; then
  if [[ "$UID" == 0 ]] && type tput &> /dev/null; then
    # If we are root, try to make that hard to miss.
    # And de-emphasize git status (we don't work as root)
    export PROMPT_USER_COLOR="$(tput bold)$(tput setab 196)$(tput setaf 0)"
    export PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  elif groups "$USER" | grep -qP '(\bwheel\b|\badmin\b|\bsysop\b)'; then
    # If we are wheel, try to make that hard to miss.
    # And de-emphasize git status (we don't work as superuser)
    export PROMPT_USER_COLOR="$(tput bold)$(tput setab 11)$(tput setaf 0)"
    export PROMPT_GIT_STATUS_COLOR="$(tput setaf 7)"
  elif groups "$USER" | grep -qP 'sudo(er(s)?)?'; then
    # If we are in sudoers,
    # Use defaults - do nothing
  :
  else
    # If we are not root, wheel, nor a sudoer,
    # Use unprivileged colorscheme
    export PROMPT_USER_COLOR="$(tput setaf 2)"
  fi
  source "$HOME"/.bash_prompt
fi
# 2}}}
  # PS2 {{{2
  # Continuation prompt
  # Default: '> '
export PS2="... "
  # 2}}}
  # PS3 {{{2
  # Option select prompt
  # Default: '#?'
export PS3='#?'
  # 2}}}
  # PS4 {{{2
  # Script debug mode prefix
  # Default: '+'
export PS4="    +++"
  # 2}}}
# 1}}}
# KEYCHAIN {{{1
#
  # determine if we want to run a new ssh-agent for this session
if type keychain &> /dev/null; then
  keychain --nogui -q
  [[ -f "$HOME/.keychain/$HOSTNAME"-sh ]]      && source "$HOME/.keychain/$HOSTNAME"-sh
  [[ -f "$HOME/.keychain/$HOSTNAME"-sh-gpg ]]  && source "$HOME/.keychain/$HOSTNAME"-sh-gpg
else
  echo "keychain(1) not found."
  if type ssh-agent &> /dev/null && [[ -z "$SSH_AGENT_PID" ]]; then
    if timeout --foreground 2s confirm "keychain(1) not found. initialize ssh-agent?"; then
       eval "$(ssh-agent)" \
       ssh-add -t 8h "$HOME/.ssh/id_rsa"
    fi
  fi
fi
# }}}
# COLORS {{{1
#
  # If we're running in screen then use colors anyway
[[ "$TERM" = "screen" ]] && export TERM="screen-256color"
[[ "$TERM" = "screen-bce" ]] && export TERM="screen-256color-bce"
  # read in dircolors
if [[ -e "$HOME"/.bash_colors ]] ; then
  eval "$(dircolors -b "$HOME"/.bash_colors)"
else
  eval "$(dircolors -b)"
fi
  # enable color support
[[ -f "$HOME"/.bash_styles ]] && source "$HOME"/.bash_styles
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
fi
# 2}}}
# 1}}}
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
[[ "$(head -c 6 /proc/version)" == "CYGWIN" ]] && [[ -f "$HOME/.bash_cygwin" ]] && source "$HOME/.bash_cygwin"
# }}}
# PRIVATE {{{1
#
  # private stuff not to be cloned to public repositories / backups
[[ -f "$HOME"/.bash_private ]] && source "$HOME"/.bash_private
# }}}
# GREETING {{{1
#
if type alsi &> /dev/null ; then
  timeout 1 alsi 2> /dev/null
else
  echo "TERM is $TERM"
  echo "DISPLAY is $DISPLAY"
fi
# }}}

# vim: ft=sh foldmethod=marker
