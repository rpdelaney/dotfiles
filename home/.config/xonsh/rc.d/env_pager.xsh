if !(which fsrx):
    $PAGER="ifne fsrx | less -R -X"
    $MANPAGER="ifne col -bx | fsrx | less -R -X"
else:
    $PAGER="ifne less -R -X"
    $MANPAGER="ifne less -R -X"
