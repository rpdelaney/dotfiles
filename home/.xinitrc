    #Disable mouse acceleration and set sensitivity
xset m 0 4

    #set keyboard layout again
setxkbmap dvorak

    #redshift
'redshift' -l 36.978:-121.98155 -t 6500:3500 &

    # environment variables for the desktop environment only
export BROWSER="firefox"       # web browser

    # xscreensaver daemon
#/usr/bin/xscreensaver -no-splash &

    #xfce
#export DE="xfce"                # desktop environment
#exec startxfce4

    #i3
export DE="i3"
exec i3
