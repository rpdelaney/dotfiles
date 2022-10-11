xontrib load abbrevs

_first("g", "git")
_first("it", "git")
_first("gittop", "cd @$(git rev-parse --show-toplevel)")

_GIT_SUBCOMMANDS = {
    "a": "add",
    "ap": "add --patch",
    "br": "branch -v",
    "bra": "branch -v -a",
    "c": "commit -v",
    "co": "checkout",
    "ca": "commit --amend",
    "cm": "commit -v -m",
    "cp": "cherry-pick",
    "d": "diff",
    "dc": "diff --cached",
    "f": "fetch",
    "fa": "fetch --all",
    "leaders": "shortlog -sn --all --no-merges",
    "lgd": "lg --first-parent",
    "m": "merge -v",
    "mt": "mergetool --no-prompt",
    "r": "reset",
    "remotes": "remote -v",
    "rb": "rebase",
    "rbi": "rebase --interactive",
    "s": "status -s",
    "st": "status",
    "sh": "show",
    "tags": "tag -l -n3 | sort -V",
# I can't stop doing this by accident lol
#   "p": "push",
# this is causing problems with thefuck
#   "push": "push --progress -v",
}
for _command in _GIT_SUBCOMMANDS.keys():
    _subcommand("git", _command, _GIT_SUBCOMMANDS[_command])

del _GIT_SUBCOMMANDS
del _command
