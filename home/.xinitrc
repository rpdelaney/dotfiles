    # Disable mouse acceleration and set sensitivity
xset m 0 4

    # set keyboard layout again
setxkbmap dvorak
numlockx on

	# security
xautolock -time 45 -locker xlock # -notify 30 -notifier ??

    # redshift
'redshift' -l 36.978:-121.98155 -t 6500:3500 &

    # environment variables for the desktop environment only
export BROWSER="firefox"

    # xscreensaver daemon
#/usr/bin/xscreensaver -no-splash &

    #i3
export DE="i3"
exec i3

# vim: ft=conf
