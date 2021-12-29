# def _command_exists(cmd: str) -> bool:
#     x = !(command -v f"{cmd}")
#     return x.returncode
#
import platform

# I create a dictionary first because then I can re-use values from one alias to another
# the mapping used by xonsh does not support this, unfortunately
_a = {}

_a["exa"]="exa --color=always --icons"
_a["ll"]=f"{_a['exa']} --long --git --links --group-directories-first --color-scale --time-style=long-iso"

_a["tree"]="tree -C -I '__pycache__'"

_a["hilite"]="grc --stdout --stderr --colour=on"
for cmd in "ping ifconfig traceroute gcc make".split():
    _a[cmd] = f"hilite {cmd}"

# use GNU utils on macOS
# homebrew does this to avoid version ambiguity in utils with the
# same name
_GNU_UTILS = [
    "base32",
    "base64",
    "basename",
    "cat",
    "chcon",
    "chgrp",
    "chmod",
    "chown",
    "chroot",
    "cp",
    "cut",
    "date",
    "dd",
    "df",
    "dir",
    "dircolors",
    "dirname",
    "du",
    "echo",
    "env",
    "expand",
    "expr",
    "factor",
    "false",
    "fmt",
    "fold",
    "grep",
    "groups",
    "head",
    "hostid",
    "id",
    "install",
    "join",
    "kill",
    "ln",
    "ls",
    "make",
    "md5sum",
    "mkdir",
    "mkfifo",
    "mknod",
    "mktemp",
    "mv",
    "nice",
    "nohup",
    "nproc",
    "od",
    "printf",
    "ptx",
    "pwd",
    "readlink",
    "realpath",
    "rm",
    "rmdir",
    "sed",
    "seq",
    "sha1sum",
    "sha224sum",
    "sha256sum",
    "sha384sum",
    "sha512sum",
    "shred",
    "shuf",
    "sleep",
    "sort",
    "split",
    "stat",
    "sync",
    "tac",
    "tail",
    "tar",
    "tee",
    "test",
    "timeout",
    "touch",
    "tr",
    "traceroute",
    "true",
    "uname",
    "uniq",
    "users",
    "wc",
    "who",
    "whoami",
    "yes",
]
if platform.system() == "Darwin":
    for util in _GNU_UTILS:
        _a[util] = f"g{util}"

# set all the aliases
for key in _a.keys():
    aliases[key] = _a[key]

del _a
