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
_GNU_UTILS = {
    "chgrp": "gchgrp",
    "chmod": "gchmod",
    "chown": "gchown",
    "mkdir": "gmkdir",
    "ls": "gls",
    "cp": "gcp",
    "mv": "gmv",
    "rm": "grm",
    "rmdir": "grmdir",
    "stat": "gstat",
}
if platform.system() == "Darwin":
    for util in _GNU_UTILS.keys():
        _a[util] = _GNU_UTILS[util]

# set all the aliases
for key in _a.keys():
    aliases[key] = _a[key]

del _a
