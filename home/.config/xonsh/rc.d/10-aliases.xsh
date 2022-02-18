# I create a dictionary first because then I can re-use values from one alias to another
# the mapping used by xonsh does not support this, unfortunately
_a = {}

_a["exa"]="exa --color=always --icons"
_a["l"]=f"{_a['exa']} --group-directories-first"
_a["ll"]=f"{_a['l']} --long --git --links --color-scale --time-style=long-iso"

_a["tree"]="tree -C -I '__pycache__'"

_a["diff"] = "colordiff"

_a["hilite"]="grc --stdout --stderr --colour=on"
for cmd in "ping ifconfig traceroute gcc make ip".split():
    _a[cmd] = f"hilite {cmd}"
