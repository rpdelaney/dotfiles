from pathlib import Path
from xontrib_commands.argerize import Command


@Command.reg
def ch(user_path: str):
    """cd with sugar"""
    path = Path(user_path)

    while not path.exists():
        hpath = Path(path.parent / f".{path.name}")
        if hpath.exists():
            path = hpath
            break
        path = path.parent

    pushd --quiet @(f"{path}")
    ll

# EOF
