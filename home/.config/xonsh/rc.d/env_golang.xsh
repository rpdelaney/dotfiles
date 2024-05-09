from pathlib import Path

if !(which go):
    gopath = Path(${...}.get('XDG_DATA_HOME', Path.home() / '.local' / 'share'))
    $GOPATH = gopath
    $GOBIN = Path(gopath, 'bin')
    del gopath
