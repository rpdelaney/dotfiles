#!/usr/bin/env bash

rot13() { echo "$1" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' ; }

#
# pacman
#

  # print a sorted list of available applications with their descriptions
alias whatisall='whatis /usr/bin/* 2> /dev/null'

  # recursively remove orphaned packages
rmorphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rs $(pacman -Qdtq)
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

#
# miscellaneous
#
  #download album art from amazon
albumart() { local y="$*";awk '/View larger image/{gsub(/^.*largeImagePopup\(.|., .*$/,"");print;exit}' <(curl -s
'http://www.albumart.org/index.php?srchkey='"${y// /+}"'&itempage=1&newsearch=1&searchindex=Music');}

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

  # search commandlinefu from commandline
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext"; }

  # download files from web via tor
turl(){ curl --sslv3 --socks5-hostname localhost:9050 "$*" ; }

  # b) function cd_func
  # This function defines a 'cd' replacement function capable of keeping,
  # displaying and accessing history of visited directories, up to 10 entries.
  # To use it, uncomment it, source this file and try 'cd --'.
  # acd_func 1.0.5, 10-nov-2004
  # Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func

