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

#Gocbi ekrpat co nct. lnafcbi a lpajycjan hrt. rb frgpo.nu
alias asdf='setxkbmap dvorak'

#save x.org output to file 
alias startx='startx &> ~/.Xoutput'

# grep 
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
                builtin cd "$1"
                ls
        elif [ -d ."$1" ]; then
                builtin cd ."$1"
                ls
        else
                echo "cd: directory "$red$bold$1$reset" not found."
        fi }           #change directory 

# not working
# alias whereami='namei "$(pwd)" -x -m | sed -r 's@f\:\s(.*)@'$bold$red'\1'$reset'@' | sed -r 's@^\s(\s*)D@'$bold$yellow'\1Mn'$reset'@' | sed -r 's@^\s(\s*)l@'$bold$cyan'\1Ln'$reset'@'


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
alias shred='shred -fu'

# youtube-dl
alias youget='youtube-dl -t -c -w --write-info-json --write-description -x -k --'

# dnuos is the new oidua
alias oidua='dnuos --file=list -D -S -t .'                                      #save a dnuos list with stats starting from pwd

##############
#
# Functions
#

#
# spit out a random password using /dev/urandom
#
genpass() {
    cat /dev/urandom | tr -dc [:alnum:] | head -c16; echo
}

#
# spit out a more secure password using /dev/urandom
#
genpassdeep() {
    cat /dev/urandom | tr -dc [:alnum:] | head -c32 | sha256deep; echo
}

#
# retrieve stock quote from yahoo finance
#
stockquote() {
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1' $1
}

#
# bash function to decompress archives - http://www.shell-fu.org/lister.php?id=375
#
unpack () {
    if [ -f $@ ] ; then
case $@ in
            *.tar.bz2) tar xvjf $@;;
            *.tar.gz) tar xvzf $@;;
            *.bz2) bunzip2 $@;;
            *.rar) unrar x $@;;
            *.gz) gunzip $@;;
            *.tar) tar xvf $@;;
            *.tbz2) tar xvjf $@;;
            *.tgz) tar xvzf $@;;
            *.zip) unzip $@;;
            *.Z) uncompress $@;;
            *.7z) 7za x $@;;
            *) echo "'$@' cannot be extracted via >extract<" ;;
        esac
else
echo "'$@' is not a valid file"
    fi
}

#
# download album art from amazon
#
albumart() { local y="$@";awk '/View larger image/{gsub(/^.*largeImagePopup\(.|., .*$/,"");print;exit}' <(curl -s 
'http://www.albumart.org/index.php?srchkey='${y// /+}'&itempage=1&newsearch=1&searchindex=Music');}

#
# define words
#
define() { curl dict://dict.org/d:$1; }

#
# define words shorter
#
def() { curl -s dict://dict.org/d:$1 | perl -ne 's/\r//; last if /^\.$/; print if /^151/../^250/'; }

######################################
# pacman
#

#
# recursively remove orphaned packages
#
rmorphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rs $(pacman -Qdtq)
  fi
}

#
# make a backup list of installed packages
#
packagebackup() { 
  comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist.txt 
}

# 
# sort installed packages by size and print a list to stdout
#
packagesize() {
  paste <(pacman -Q | awk '{ print $1; }' | xargs pacman -Qi | grep 'Size' | awk '{ print $4$5; }') <(pacman -Q | awk '{print $1; 
}') | sort -n | column -t | 'sed' -r 's@\.[0-9]{2}KiB@MiB@'
}

###################################################
#
# Not pacman
#

# 
# print a graphical tree of directories to stdout
# 
dirtree() {
        ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

# 
# print a sorted list of available applications with their descriptions
# 
alias whatisall='whatis /usr/bin/* 2> /dev/null'

# 
# print a traceroute and geolocation of an internet address
# 
iptrace() {
        mtr -o RSDA -r -c 1 -b $1 && lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1 | grep address --color=never | grep -P --color=never 'city|state|country' | awk '{print $3,$4,$5,$6,$7,$8}' | sed -r 's@ip\saddress\sflag\s@@g' | sed 's@My@@'
}


#
# view today's xkcd and the tagline
#
xkcd(){ wget -qO- http://xkcd.com/|tee >(feh $('grep' -Po '(?<=")http://imgs[^/]+/comics/[^"]+\.\w{3}'))|'grep' -Po '(?<=(\w{3})" title=").*(?=" alt)';}

# 
# print a diff of two directory trees
# 
dirdiff() {
        diff <(cd $1 && find | sort) <(cd $2 && find | sort)
}

# 
# find duplicate files in pwd by md5sum
# 
fdupes() {
        find -L -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 33 | cut -c 35- ; }

# 
# return the first of existing files
# 
myfirst () { local i fn=$1; shift; for i; do $fn "$i" && echo "$i" && return; done; return 1; }

# 
# create a thumbnail of a video file
#
thumbnail() { ffmpeg  -itsoffset -20 -i $i -vcodec mjpeg -vframes 1 -an -f rawvideo -s 640x272 ${i%.*}.jpg; }

# 
# capture alsa audio to an mp3 file
#
# not working: sox captures audio and pipes a stream, but as written ffmpeg does not read from stdin.
#
#alsamp3() { ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 96k output.mp3; }

# 
# fix broken flv files that can't seek
# 
fixflv() { ffmpeg -i broken.flv -acodec copy -vcodec copy fixed.flv; }

# 
# get duration of audio file
#
duration() { durline=$(sox "$1" -n stat 2>&1|grep "Length (seconds):");echo ${durline#*\: }; }
