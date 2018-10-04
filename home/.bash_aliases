#!/usr/bin/env bash

if [[ $UID -ne 0 ]]; then
    # cleanly become another user
  alias become='sudo su --login'

    # sudo a command, preserving the current environment
  alias sudoe='sudo -E'

    # yay
  if type yay &> /dev/null; then
    alias ya='\yay'
    alias yaq='\yay -Q'
    alias yas='\yay -S'
    alias yass='\yay -Ss'
    alias yars='\yay -Rs'
  else
    alias ya='\pacman --color=always'
    alias yaq='\pacman --color=always -Q'
    alias yas='\pacman --color=always -S'
    alias yass='\pacman --color=always -Ss'
    alias yars='\pacman --color=always -Rs'
  fi

    # watch incoming network connections
  alias netmonitor='\sudo watch -n 3 lsof -i'

  if type youtube-dl &> /dev/null ; then
      # don't mark videos watched
    alias youtube-dl='youtube-dl --no-mark-watched'
      # youtube-dl with lots of metadata
    alias youget='youtube-dl -t -c -w --write-info-json --write-description --'
      # Convert Youtube videos to MP3
    alias youtube-dla='youtube-dl -t --extract-audio --audio-format mp3 --'
  fi

    # save a dnuos list with stats starting from pwd
  type dnuos &> /dev/null && alias oidua='\dnuos --file=list -D -S -t .'

    # tmux is the new screen
  type tmux &> /dev/null && [[ -f "$XDG_CONFIG_HOME"/tmux/tmux.conf ]] && alias tmux='tmux -f ~/.config/tmux/tmux.conf'

    # mpd
  if type ncmpcpp &> /dev/null ; then
      alias mplay='ncmpcpp play'
      alias mpause='ncmpcpp pause'
      alias mtoggle='ncmpcpp toggle'
      alias mstop='ncmpcpp stop'
      alias mnext='ncmpcpp next'
      alias mprev='ncmpcpp prev'
      alias mvolume='ncmpcpp volume'
  fi

    # vlc is best from a terminal :V
  type vlc &> /dev/null && alias ncvlc='vlc -I ncurses'

else
    # watch incoming network connections
  alias netmonitor='watch -n 3 lsof -i'
fi
    # ls / exa
if type exa &> /dev/null && exa $TMPDIR &> /dev/null ; then
  # exa aliases go here
  alias l='exa --group-directories-first'
  alias ll='exa --long --header --git --links --group-directories-first'
  alias la='ll --all'
  alias lr='ll -T --level 2'
else
  alias l='\ls --color=always --format=across --group-directories-first'
  alias ll='\ls --color=always --group-directories-first -h -L -l --indicator-style=slash --time-style=+"%Y-%m-%d"'
  alias la='ll -H -a'
  alias lr='ll -R'
fi 

alias lla='la'
alias lll='ll | pager'
alias llla='lla | pager'

    # safety valve
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'
alias chown='\chown -c --preserve-root'
alias chmod='\chmod -c --preserve-root'
alias chgrp='\chgrp -c --preserve-root'

  # Make directory including intermediate directories
alias mkdir='\mkdir -vp'

    # Gocbi ekrpat co nct. lnafcbi a lpajycjan hrt. rb frgpo.nu
alias asdf='setxkbmap dvorak'

    # colordiff is the new diff
type colordiff &> /dev/null && alias diff='colordiff'

    # use grc to add color command support
if type grc &> /dev/null ; then
    alias hilite='\grc -es --colour=on'
    alias configure='hilite ./configure'
    alias make='hilite make'
    alias gcc='hilite gcc'
    alias g++='hilite g++'
    alias as='hilite as'
    alias gas='hilite gas'
    alias ld='hilite ld'
    alias netstat='hilite netstat'
    alias ping='hilite ping'
    alias traceroute='hilite /usr/sbin/traceroute'
fi

    # use colors in ip
if type ip &> /dev/null; then
  alias ip='ip -d -c'
fi

    # disk usage in plain english
alias disk='\df -lTH'
alias df='\df -h'

    # gpg is the new pgp
type gpg &> /dev/null && alias pgp='gpg'

    # console pastebin
type curl &> /dev/null && alias sprunge='curl -F "sprunge=<-" http://sprunge.us'

    # rsync is the new (s)cp
type rsync &> /dev/null && alias rp='\rsync -a --append --stats --progress'

    # rsync is the new mv
type rsync &> /dev/null && alias rv='\rsync -a --append --stats --progress --remove-source-files'

    # grep can be pretty :*
if type grep &> /dev/null; then
  alias crep='\grep --color=always'
  alias acrep='\agrep --color=always'
  alias fcrep='\fgrep --color=always'
  alias ecrep='\egrep --color=always'
  alias search='\grep --color=never -H --binary-files=text --directories=recurse --files-with-matches -n'
fi

    # mount
type mount &> /dev/null && type column &> /dev/null && alias mounts='\mount | \column -t | pager'
type mountpoint &> /dev/null && alias mp='mountpoint'

    # private shredder
type shred &> /dev/null && alias shred=' shred -v'

  # always make secure passwords
type apg &> /dev/null && alias apg=' apg -a 1 -n 1 -m 16 -x 32'

  # weechat is dumb
type weechat &> /dev/null && [[ -n "$XDG_CONFIG_HOME" ]] && alias weechat='weechat -d '"$XDG_CONFIG_HOME"'/weechat/'

  # dosbox coercion to use XDG standard
type dosbox &> /dev/null && [[ -f "$XDG_CONFIG_HOME/dosbox/dosbox.conf" ]] && alias dosbox="dosbox -conf $XDG_CONFIG_HOME/dosbox/dosbox.conf"

  # getmail coercion to use XDG standard
getmaildir="$XDG_CONFIG_HOME/getmail"
if type getmail &> /dev/null; then
  if [[ -d  "$getmaildir" ]]; then
    alias getmail='getmail --getmaildir='"$getmaildir"
  fi
fi

  # get (s)mplayer to use sensible defaults
if type mplayer &> /dev/null ; then
  alias mplayer='mplayer -loop 0 -fixed-vo -softvol -msgcolor'
fi

if type smplayer &> /dev/null ; then
  alias smplayer='smplayer -no-close-at-end -mpcgui'
  alias smadd='smplayer -add-to-playlist'
fi

  # abook coercion to use XDG standard
if type abook &> /dev/null && [[ -n "$XDG_CONFIG_HOME" ]] ; then
  datafile="$HOME/docs/addressbook"
  if [[ -r "$datafile" ]]; then
    alias abook="abook --config $XDG_CONFIG_HOME/abook/abookrc --datafile $datafile"
  else
    alias abook="abook --config $XDG_CONFIG_HOME/abook/abookrc"
  fi
fi

  # copy-paste to clipboard
if type xclip &> /dev/null ; then
  alias clip="xclip -selection clipboard"
fi

  # steamcurses
if type steamcurses &> /dev/null ; then
  alias steamcurses='steamcurses --config-path ~/.config/steamcurses/config'
fi

  # pudb
if type pudb3 &> /dev/null; then
  alias pudb='pudb3'
fi

  # vim monkey stuff
alias ZQ='exit'
alias ZZ='exit'

  # netctl-auto
  # if netctl-auto is running, then manually starting a wireless network with
  # 'netctl' will always fail. therefore, we alias 'netctl' to 'netctl-auto'
if type netctl-auto &> /dev/null; then
  systemctl status netctl-auto@wlp7s0 &> /dev/null
  if [[ $? -eq 0 ]]; then
    alias netctl='netctl-auto'
  fi
fi

  # pypi2pkgbuild
if type pypi2pkgbuild.py &> /dev/null; then
  alias pypi2pkg='PKGEXT=.pkg.tar pypi2pkgbuild.py -g cython -b /tmp/pypi2pkgbuild/ -f'
fi

  # sxiv
if type sxiv &> /dev/null; then
  alias sxiv='sxiv -a -p'
fi

  # macos
if type gtimeout &> /dev/null; then
  alias timeout='gtimeout'
fi
if type gmv &> /dev/null; then
  alias mv='gmv'
fi
if type gcp &> /dev/null; then
  alias cp='gcp'
fi
if type grm &> /dev/null; then
  alias rm='grm'
fi
