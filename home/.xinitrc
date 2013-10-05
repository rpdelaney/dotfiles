#Disable mouse acceleration and set sensitivity
xset m 0 4

#set keyboard layout again
setxkbmap dvorak

#redshift
'redshift' -l 36.978:-121.98155 -t 6500:3500 &

# 
# environment variables for the desktop environment only
# 
export DE="xfce"                # desktop environment
export BROWSER="tor-browser"       # web browser

#
# xscreensaver daemon
#
/usr/bin/xscreensaver -no-splash &

#xfce
#gtmanfred said i dont need --witch-ck-launch
#exec startxfce4 --with-ck-launch
exec startxfce4


