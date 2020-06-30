#!/usr/bin/env bash
#

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
[[ -z "$PS1" ]] && return

shellrc_exec() {
  declare script="$1"
  declare ostype="$2"
  declare platform
  platform=$(basename "$script" | cut -f 2 -d'-')
  declare type
  type=$(basename "$script" | cut -f 3 -d'-')

  if [[ "$platform" == "all" ]] || [[ "$platform" == "$ostype" ]]; then
    if [[ "$type" == "bash" ]] || [[ "$type" == "all" ]]; then
      # shellcheck disable=SC1090
      source "$script"
    fi
  fi
}

if ! command -v "$HOME"/bin/ostype >/dev/null 2>&1 ; then echo "Missing dependency: $HOME/bin/ostype" 1>&2 ; exit 1 ; fi
_ostype="$("$HOME"/bin/ostype)"

for file in "${HOME}"/.shellrc.d/*; do
  # Only run the executable files
  [[ ! -x "$file" ]] && continue

  if ! shellrc_exec "$file" "$_ostype" ; then
    echo "ERROR: failure when executing $file" 1>&2
    echo "Terminating shellrc.d" 1>&2
    break
  fi
done

# ALIASES {{{1
#
  # chdir
  # shellcheck disable=SC1090
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
# ENVIRONMENT 1}}}
# PRIVATE {{{1
#
  # private stuff not to be cloned to public repositories / backups
  # shellcheck disable=SC1090
[[ -f "$HOME"/.bash_private ]] && source "$HOME"/.bash_private
# }}}


# EOF
