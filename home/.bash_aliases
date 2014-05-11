#!/usr/bin/env bash

if [[ $UID -ne 0 ]]; then
    # yaourt
  if type yaourt &> /dev/null; then
    alias ya='\yaourt'
    alias yaq='\yaourt -Q'
    alias yas='\yaourt -S'
    alias yass='\yaourt -Ss'
    alias yars='\yaourt -Rs'
  fi
    # watch incoming network connections
  alias netmonitor='\sudo watch -n 3 lsof -i'

    # youtube-dl with lots of metadata
  type youtube-dl &> /dev/null && alias youget='\youtube-dl -t -c -w --write-info-json --write-description --'

    # save a dnuos list with stats starting from pwd
  type dnuos &> /dev/null && alias oidua='\dnuos --file=list -D -S -t .'

    # tmux is the new screen
  type tmux &> /dev/null && alias tmux='tmux -f ~/.config/tmux/tmux.conf'

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
  #if type yaourt &> /dev/null; then
  #  alias ya='\yaourt'
  #  alias yaq='\yaourt -Q'
  #  alias yas='\yaourt -S'
  #  alias yass='\yaourt -Ss'
  #  alias yars='\yaourt -Rs'
  #fi
    # watch incoming network connections
  alias netmonitor='watch -n 3 lsof -i'
fi
    # ls
alias l='\ls --color=always --format=across --group-directories-first'
alias ll='\ls --color=always --group-directories-first -h -L -l --indicator-style=slash --time-style=+"%Y-%m-%d"'
alias la='ll -H -a'
alias lr='ll -R'
alias lla='la'
alias lll='ll | pager'
alias llla='lla | pager'
alias .='ll'
alias ..='\cd ..'
alias ....='\cd ../..'

    # safety valve
alias mv='\mv -iv'
alias cp='\cp -iv'
alias rm='\rm -Iv'
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

    # disk usage in plain english
alias disk='\df -lTH'
alias df='\df -h'
alias du='\df -c -h'

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
alias mounts='\mount | \column -t | pager'

    # private shredder
type shred &> /dev/null && alias shred=' shred -vfu'

  # always make secure passwords
type pwgen &> /dev/null && alias pwgen=' pwgen -scny'

  # weechat is dumb
type weechat &> /dev/null && alias weechat='weechat -d '"$XDG_CONFIG_HOME"'/weechat/'
