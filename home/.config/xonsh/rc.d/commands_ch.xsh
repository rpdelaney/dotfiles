from pathlib import Path
from xontrib_commands.argerize import Command


@Command.reg
def ch(user_path: str):
    """cd with sugar"""
    path = Path(user_path)

    if path.is_dir(follow_symlinks=True):
        pushd --quiet @(f"{path}")
        return

    if path.is_file(follow_symlinks=True):
        pushd --quiet @(f"{path.parent}")
        return

    # check for the hidden version
    while not path.exists():
        hpath = Path(path.parent / f".{path.name}")
        if hpath.exists():
            path = hpath
            break
        path = path.parent

    pushd --quiet @(f"{path}")
    ll

# EOF
