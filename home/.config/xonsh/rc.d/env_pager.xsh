if !(which fsrx):
    $PAGER="fsrx | ifne less -R -X"
    $MANPAGER="col -bx | fsrx | ifne less -R -X"
else:
    $PAGER="ifne less -R -X"
    $MANPAGER="ifne less -R -X"
