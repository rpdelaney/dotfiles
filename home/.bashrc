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

shellrc_exec() {
  local script
  script="$1"
  local ostype
  ostype="$2"
  local platform
  platform=$(basename "$script" | cut -f 2 -d'-')
  local type
  type=$(basename "$script" | cut -f 3 -d'-')

  if [[ "$platform" == "all" ]] || [[ "$platform" == "$ostype" ]]; then
    if [[ "$type" == "bash" ]] || [[ "$type" == "all" ]]; then
      # shellcheck disable=SC1090
      source "$script" || return 1
    fi
  fi
  return 0
}

_ostype="$(ostype)"

for file in "${HOME}"/.shellrc.d/*; do
  if ! shellrc_exec "$file" "$_ostype" ; then
    echo "ERROR: failure when executing $file" 1>&2
    echo "Terminating shellrc.d" 1>&2
    break
  fi
done

# ALIASES {{{1
#
  # chdir
[[ -f "$HOME"/bin/chdir ]] && source "$HOME"/bin/chdir 1> /dev/null
  # make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
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
# export ANDROID_SERIAL="0146B5040401801E"
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
# ENVIRONMENT 1}}}
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
export PS4="+ ${FUNCNAME[0]:+${FUNCNAME[0]}():}line ${LINENO}: "
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
    if timeout --foreground 1s confirm "keychain(1) not found. initialize ssh-agent?"; then
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
# MACOS {{{1
if [[ "$OSTYPE" =~ ^darwin ]]; then
  # Initialize homebrew command-not-found
  if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
fi
# MACOS 1}}}
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

# vim: filetype=sh foldmethod=marker shiftwidth=2 expandtab softtabstop=4:
