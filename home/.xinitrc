# Archwiki [[Nvidia_Optimus]] told me to put this here
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

    # Kill X with Ctrl-Alt-Backspace
setxkbmap -option terminate:ctrl_alt_bksp

    # security
    # this throws an error as-is. fix it before re-enabling
#xautolock -time 45 -locker freeze -notify 30 -notifier notify-send -t 30000 "Locking due to idle state..."

    # redshift
#redshift &

    # notify daemon
dunst &

    # environment variables for the desktop environment only
export BROWSER="firefox"

    # xscreensaver daemon
#/usr/bin/xscreensaver -no-splash &

    #i3
export DE="i3"
i3

    # Merge in .Xdefaults
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

# EOF
