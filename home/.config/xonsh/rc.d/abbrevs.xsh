import platform

xontrib load abbrevs

def _first(word, sub):
    """Perform the substitution if and only if the command is the first word on the line."""
    abbrevs[word] = lambda buffer, word: sub if buffer.text.startswith(word) else word


def _subcommand(command, subcommand, sub):
    """If and only if the first word on the line is 'command', add 'w"""
    abbrevs[subcommand] = (
        lambda buffer, word: sub
        if buffer.text.startswith(command) and buffer.text.split()[1] == subcommand
        else word
    )


abbrevs["ix"] = "curl --data-binary @- https://paste.rs"

_first("ZQ", "exit")
_first("ZZ", "exit")
_first("ch", "cd <edit> && ll")
_first("pw", "pwstore")
_first("keychain", 'keychain --dir "$XDG_DATA_HOME/keychain" --absolute')
_first("mediainfo", "mediainfo --Output=JSON <edit> | jq -C")
_first("jq", "jq --color-output")

_first("chgrp", "chgrp -c")
_first("chmod", "chmod -c")
_first("chown", "chown -c")
_first("mkdir", "mkdir -v")
_first("cp", "cp -v -i --reflink=auto")
_first("mv", "mv -v -i")
_first("rm", "rm -v --interactive=once")
_first("rmdir", "rmdir -v")

_first("la", "ll --all")
_first("lll", "ll <edit> | pager")
_first("lla", "ll --all <edit> | pager")
_first("lt", "ll --all --tree --level 2")

_GIT_SUBCOMMANDS = {
    "ap": "add --patch",
    "br": "branch -v",
    "bra": "branch -v --all",
    "c": "commit --verbose",
    "co": "checkout",
    "cp": "cherry-pick",
    "d": "diff",
    "dc": "diff --cached",
    "f": "fetch",
    "fa": "fetch --all",
    "lgd": "lg --first-parent",
    "r": "reset",
    "s": "status --short",
    "st": "status",
    "tags": "tag --list -n3",
    "m": "merge -v",
    "leaders": "shortlog -sn --all --no-merges",
}

for command in _GIT_SUBCOMMANDS.keys():
    _subcommand("git", command, _GIT_SUBCOMMANDS[command])

# Do different stuff when we are on macOS
if platform.system() == "Darwin":
    abbrevs["clip"] = "pbcopy"
    abbrevs["paste"] = "pbpaste"
else:
    abbrevs["clip"] = "kitty +kitten clipboard"
    abbrevs["paste"] = "kitty +kitten clipboard --get-clipboard"
