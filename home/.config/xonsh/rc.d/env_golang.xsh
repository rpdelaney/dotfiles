from pathlib import Path

gopath = Path(${...}.get('XDG_DATA_HOME', Path.home() / '.local' / 'share'))
$GOPATH = gopath
$GOBIN = Path(gopath, 'bin')
del gopath
