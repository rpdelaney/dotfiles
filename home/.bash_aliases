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
# find to kill
#
alias ftk='echo "  PID  PGID   SID TTY          TIME CMD" && ps -e | grep -i'

#
# disk usage in plain english
#
alias disk='df -lT --block-size=1048576'

#
# htop is the new top
#
alias top='htop'

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
alias startx='startx &> ~/.Xoutput'

#
# grep 
#
alias grep='/usr/bin/grep --color=always'
alias fgrep='/usr/bin/fgrep --color=always'
alias egrep='/usr/bin/egrep --color=always'
alias search='/usr/bin/grep --color=always -H --binary-files=text --directories=recurse --files-with-matches -n'

#
# pwd
#
alias ls='/usr/bin/ls --color=always --group-directories-first -h -L -o -p -X --time-style=+"%Y-%m-%d"'
alias la='ls -H -a'
alias lsa='la'
alias lss='ls | pager'
alias lssa='lsa | pager'

alias dir='/usr/bin/ls --color=always --format=across --group-directories-first'
alias dirs='dir | pager'

# 
# pager
# 
#alias pager='/usr/bin/less -R -X'      #now in /usr/bin
alias more='pager'                      #Less is more

#
# getting around
# 
alias .='ls'
alias ..='ch ..'
alias ....='ch ../..'

ch() { 
        if [ -d "$1" ]; then 
            new_dir=$1
        elif [ -d ."$1" ]; then
            new_dir="."$1
        elif [ "$1" == '-' ]; then
            new_dir="-"
        else
            error_msg="cd: directory "$red$bold$1$reset" not found."
        fi 
        
        if [ "$error_msg" ]; then
            echo $error_msg
        else
            builtin cd $new_dir
            timeout 3 git_branch=$(parse_git_branch)
            ls
        fi
}

# where the heck am I
whereami() { 
        namei "$PWD" -x -m | \
        sed -r 's@f\:\s(.*)@'$bold$red'\1'$reset'@' | \
        sed -r 's@^\s(\s*)D@'$bold$yellow'\1Mn'$reset'@' | \
        sed -r 's@^\s(\s*)l@'$bold$cyan'\1Ln'$reset'@'
}

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

#curl
#alias define='curl dict://dict.org/d:'

# panic button
alias abandonship='sudo shutdown -h -P now'

# networking
alias netmonitor='sudo watch -n 3 lsof -i'                                      # watch incoming network connections

# mount
alias mounts='mount | column -t | pager'

# dos
alias traceroute='mtr'                                                          # mtr is the new tracert
alias tracert='traceroute'

# shredder
alias shred=' shred -vfu'

# youtube-dl
alias youget='youtube-dl -t -c -w --write-info-json --write-description -x -k --'

# dnuos is the new oidua
alias oidua='dnuos --file=list -D -S -t .'                                      #save a dnuos list with stats starting from pwd

