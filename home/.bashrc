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

if [[ "$_ostype" == "macos" ]] && [[ -x "/opt/homebrew/bin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi


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
  # shellcheck disable=SC1090,1091
[[ -f "$HOME"/bin/chdir ]] && source "$HOME"/bin/chdir 1> /dev/null
  # shellcheck disable=SC1090,1091
  # make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
# }}}
# PRIVATE {{{1
#
  # private stuff not to be cloned to public repositories / backups
  # shellcheck disable=SC1090,SC1091
[[ -f "$HOME"/.bash_private ]] && source "$HOME"/.bash_private
# }}}

# EOF
