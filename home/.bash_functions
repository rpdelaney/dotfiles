#!/usr/bin/env bash

# usage: sprunge FILE 
# or some_command | sprunge
unalias sprunge &> /dev/null
sprunge() { curl -F 'sprunge=<-' http://sprunge.us < "${1:-/dev/stdin}"; } 

# usage: qrcode FILE
# or some_command | qrcode
unalias qrcode &> /dev/null
qrcode() { curl -F-=\<- qrenco.de < "${1:-/dev/stdin}"; }

rot13() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < "${1:-/dev/stdin}"; }

#
# pacman
#

  # print a sorted list of available applications with their descriptions
if type whatis &> /dev/null; then alias whatisall='whatis /usr/bin/* 2> /dev/null'; fi

  # recursively remove orphaned packages
rmorphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rs "$(pacman -Qdtq)"
  fi
}

  # make a backup list of installed packages
packagebackup() {
  comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort)
}

  # sort installed packages by size and print a list to stdout
packagesize() {
  paste <(pacman -Q | awk '{ print $1; }' | xargs pacman -Qi | \
  grep 'Size' | awk '{ print $4$5; }') \
  <(pacman -Q | awk '{print $1;}') | sort -n | column -t | \
  'sed' -r 's@\.[0-9]{2}KiB@MiB@'
}

#
# manipulating multimedia
#
  # create a thumbnail of a video file
thumbnail() { ffmpeg  -itsoffset -20 -i "$1" -vcodec mjpeg -vframes 1 -an -f rawvideo -s 640x272 "${1%.*}".jpg; }

  # capture alsa audio to an mp3 file
  # not working: sox captures audio and pipes a stream. but as written, ffmpeg does not read from stdin.
#alsamp3() { ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 96k output.mp3; }

  # get duration of audio file
duration() { durline=$(sox "$1" -n stat 2>&1|grep "Length (seconds):");echo "${durline#*\: }"; }

  # view today's xkcd and the tagline
xkcd(){ wget -qO- http://xkcd.com/|tee >(feh "$('grep' -Po '(?<=")http://imgs[^/]+/comics/[^"]+\.\w{3}')")|'grep' -Po '(?<=(\w{3})" title=").*(?=" alt)';}


  # Parse YouTube url (get youtube video id)
youtube-urlid() {
 url="$*"

 for i in ".*youtu\.be/\([^\/&?#]\+\)" ".*youtu.\+v[=/]\([^\/&?#]\+\)" ".*youtu.\+embed/\([^\/&?#]\+\)"; do
  vid="$(expr "${url}" : "${i}")"
  if [[ -n "$vid" ]]; then
    echo "$vid"
  fi
 done
}


if type youtube-dl &> /dev/null ; then
  youtube-watch() {
    # watch video youtube without flash but with mplayer and youtube-dl
    mplayer $(youtube-dl -g "$*")
  }

  youtube-listen() {
    :
  }

  youtube-chanrip() {
    # Download Entire YouTube Channel - all of a user's videos
    for i in $(curl -s http://gdata.youtube.com/feeds/api/users/"$1"/uploads | grep -Eo "watch\?v=[^[:space:]\"\'\\]{11}" | uniq); do
      youtube-dl --title --no-overwrites http://youtube.com/"$i"
    done 
  }
  youtube-playlistdl() {
    # Download YouTube music playlist and convert it to mp3 files
    :
  }

  youtube2gif() {
    # Create an animated gif from a Youtube video
    url="$1"
    id="$(youtube-urlid "$url")"
    tmpfile="$TMPDIR/$id.flv"

    youtube-dl -o "$tmpfile" "$url"
    mplayer "$tmpfile" -ss 03:16 -endpos 5 -vo jpeg:outdir="$id":quality=100:smooth=30:progressive -vf scale=320:240 -nosound
    convert -delay 4 -loop 0 "$TMPDIR/$id"/*.jpg "$TMPDIR/$id".gif
  }


fi
#
# miscellaneous
#
  #download album art from amazon
albumart() { local y="$*";awk '/View larger image/{gsub(/^.*largeImagePopup\(.|., .*$/,"");print;exit}' <(curl -s 'http://www.albumart.org/index.php?srchkey='"${y// /+}"'&itempage=1&newsearch=1&searchindex=Music');}

  # define words
define() { 
  if type torsocks &> /dev/null; then
    torsocks curl -s dict://dict.org/d:"$1"
  else
    curl -s dict://dict.org/d:"$1"
  fi
}

  # define words shorter
def() { 
  if type torsocks &> /dev/null; then
    torsocks curl -s dict://dict.org/d:"$1" | perl -ne 's/\r//; last if /^\.$/; print if /^151/../^250/'; 
  else
    curl -s dict://dict.org/d:"$1" | perl -ne 's/\r//; last if /^\.$/; print if /^151/../^250/'; 
  fi
}

  # jobs count
jobscount(){
    jobs_cnt=$(jobs -s | wc -l)
    if [ "$jobs_cnt" -eq 0 ]; then
        echo -n ""
    else
        echo -n "$jobs_cnt "
    fi
}

  # download files from web via tor
  # it's better to just use torsocks though
turl(){ curl --sslv3 --socks5-hostname localhost:9050 "$*" ; }

  # spit out N random words
werd() { 
  # Default 1 word, unless an integer is passed
  i="${1:-1}"
  shuf -n "$i" /usr/share/dict/english
}
