#
# colordiff is the new diff
#
type colordiff &> /dev/null && alias diff='colordiff'

#
# use grc to add color command support
#
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

#
# disk usage in plain english
#
alias disk='\df -lTH'

#  
# pgsql is dumb and annoying
# 
alias pgsql='\psql'

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
alias onscreen='\startx | tee ${HOME}/.Xoutput'

#
# rsync is the new (s)cp
#
alias rp='\rsync -a --append --stats --progress'

#
# rsync is the new mv
#
alias rv='\rsync -a --append --stats --progress --remove-source-files'

#
# grep can be pretty :*
#
alias grep='\grep --color=always'
alias agrep='\agrep --color=always'
alias fgrep='\fgrep --color=always'
alias egrep='\egrep --color=always'
alias search='\grep --color=always -H --binary-files=text --directories=recurse --files-with-matches -n'

#
# pwd
#
alias ls='\ls --color=always --group-directories-first -h -L -l --indicator-style=slash --time-style=+"%Y-%m-%d"'
alias la='ls -H -a'
alias lsa='la'
alias lss='ls | pager'
alias lssa='lsa | pager'

alias dir='\ls --color=always --format=across --group-directories-first'
alias dirs='dir | pager'

# 
# pager
# 
alias more='pager'                      #Less is more

#
# getting around
# 
alias .='ls'
alias ..='ch ..'
alias ....='ch ../..'

# 
# safety valve
# 
alias mv='\mv -iv'
alias cp='\cp -iv'
alias rm='\rm -Iv'
alias rr='\rm -r'
alias chown='\chown -c --preserve-root'
alias chmod='\chmod -c --preserve-root'
alias chgrp='\chgrp -c --preserve-root'
alias mkdir='\mkdir -vp'

# ventriloquist
alias sudoe="\sudo -E"

# head/tail autosized to terminal width
#alias head='cl head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
#alias tail='cl tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'

# networking
alias netmonitor='\sudo watch -n 3 lsof -i'                                      # watch incoming network connections

# mount
alias mounts='\mount | column -t | pager'

# dos
alias traceroute='\mtr'                                                          # mtr is the new tracert
alias tracert='traceroute'

# private shredder
alias shred=' shred -vfu'

# youtube-dl
alias youget='\youtube-dl -t -c -w --write-info-json --write-description --'

# dnuos is the new oidua
alias oidua='\dnuos --file=list -D -S -t .'                                      #save a dnuos list with stats starting from pwd

# yaourt is the new pacman
alias yao='\yaourt'
alias yaos='yao -S'
alias yaoss='yao -Ss'
alias yaors='yao -Rs'
