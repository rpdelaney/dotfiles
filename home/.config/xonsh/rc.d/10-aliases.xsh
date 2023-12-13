# I create a dictionary first because then I can re-use values from one alias to another
# the mapping used by xonsh does not support this, unfortunately
_a = {}

_a["eza"]="eza --color=always --icons"
_a["l"]=f"{_a['eza']} --group-directories-first"
_a["ll"]=f"{_a['l']} --long --git --links --color-scale=all --time-style=long-iso --mounts --no-time"

_a["tree"]="tree -C -I '__pycache__'"

_a["diff"] = "colordiff"

# poor man's "thefuck" integration
_a["fuck"] = lambda args, stdin=None: execx($(thefuck @(__xonsh__.history[-1].cmd)))

_a["hilite"]="grc --stdout --stderr --colour=on"
for cmd in "ping ifconfig traceroute gcc make ip".split():
    _a[cmd] = f"hilite {cmd}"
