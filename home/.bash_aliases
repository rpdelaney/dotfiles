# use grc to add color command support
if [ -x /usr/bin/grc ] ; then

    alias hilite='/usr/bin/grc -es --colour=on'

    alias configure='hilite ./configure'
    alias diff='colordiff'                          #colordiff is the new diff
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

#
# disk usage in plain english
#
alias disk='df -lT --block-size=1048576'

#  
# pgsql is dumb and annoying
# 
alias pgsql='psql'

#
# best pastebin evar
#
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'

#
# Gocbi ekrpat co nct. lnafcbi a lpajycjan hrt. rb frgpo.nu
#
alias asdf='setxkbmap dvorak'

#
# save x.org output to file 
#
alias onscreen='startx | tee ${HOME}/.Xoutput'

#
# rsync is the new (s)cp
#
alias rp='rsync -a --append --stats --progress'

#
# rsync is the new mv
#
alias rv='rsync -a --append --stats --progress --remove-source-files'

#
# grep can be pretty :*
#
alias grep='/usr/bin/grep --color=always'
alias agrep='/usr/bin/agrep --color=always'
alias fgrep='/usr/bin/fgrep --color=always'
alias egrep='/usr/bin/egrep --color=always'
alias search='/usr/bin/grep --color=always -H --binary-files=text --directories=recurse --files-with-matches -n'

#
# pwd
#
alias ls='/usr/bin/ls --color=always --group-directories-first -h -L -l --indicator-style=slash --time-style=+"%Y-%m-%d"'
alias la='ls -H -a'
alias lsa='la'
alias lss='ls | pager'
alias lssa='lsa | pager'

alias dir='/usr/bin/ls --color=always --format=across --group-directories-first'
alias dirs='dir | pager'

# 
# pager
# 
alias more='pager'                      #Less is more

#
# getting around
# 
alias ch='source '"$HOME"'/bin/chdir'
alias .='ls'
alias ..='ch ..'
alias ....='ch ../..'

# 
# safety valve
# 
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'
alias rr='rm -r'
alias chown='chown -c --preserve-root'
alias chmod='chmod -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'
alias mkdir='mkdir -vp'

# ventriloquist
alias sudoe="/usr/bin/sudo -E"

# head/tail autosized to terminal width
#alias head='cl head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
#alias tail='cl tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'

# networking
alias netmonitor='sudo watch -n 3 lsof -i'                                      # watch incoming network connections

# mount
alias mounts='mount | column -t | pager'

# dos
alias traceroute='mtr'                                                          # mtr is the new tracert
alias tracert='traceroute'

# private shredder
alias shred=' shred -vfu'

# youtube-dl
alias youget='youtube-dl -t -c -w --write-info-json --write-description -x -k --'

# dnuos is the new oidua
alias oidua='dnuos --file=list -D -S -t .'                                      #save a dnuos list with stats starting from pwd

# yaourt is the new pacman
alias yao='yaourt'
alias yaos='yao -S'
alias yaoss='yao -Ss'
alias yaors='yao -Rs'
