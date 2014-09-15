    # Disable mouse acceleration and set sensitivity
xset m 0 4

    # set keyboard layout again
setxkbmap dvorak
# numlockx on

	# security
# xautolock -time 45 -locker xlock # -notify 30 -notifier ??

    # redshift
#redshift -l 36.978:-121.98155 -t 6500:3500 &
#redshift -b 1:0.65 -l 37:-122 -t 6500:3500 &

	# notify daemon
dunst &

    # environment variables for the desktop environment only
export BROWSER="firefox"

    # xscreensaver daemon
#/usr/bin/xscreensaver -no-splash &

    #i3
export DE="i3"
exec i3

	# Merge in .Xdefaults
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
# vim: ft=conf
