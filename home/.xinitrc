    # Disable mouse acceleration and set sensitivity
xset m 0 4

    # set keyboard layout again
setxkbmap dvorak
    # Kill X with Ctrl-Alt-Backspace
setxkbmap -option terminate:ctrl_alt_bksp

	# security
xautolock -time 45 -locker freeze -notify 30 -notifier notify-send -t 30000 "Locking due to idle state..."

    # redshift
redshift -b 1:0.55 -l 37:-122 -t 6500:2500 &

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
