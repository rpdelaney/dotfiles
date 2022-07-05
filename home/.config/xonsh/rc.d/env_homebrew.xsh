if platform.system() == "Darwin":
    $HOMEBREW_PREFIX="/opt/homebrew"
    $HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    $HOMEBREW_REPOSITORY="/opt/homebrew"
    try:
        $MANPATH.append(":/opt/homebrew/share/man")
    except KeyError:
        $MANPATH=":/opt/homebrew/share/man"
    try:
        $INFOPATH.append(":/opt/homebrew/share/info")
    except KeyError:
        $INFOPATH=":/opt/homebrew/share/info"
