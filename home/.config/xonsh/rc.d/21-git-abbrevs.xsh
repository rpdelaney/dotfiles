xontrib load abbrevs

_first("g", "git")
_first("gittop", "cd @$(git rev-parse --show-toplevel)")

_GIT_SUBCOMMANDS = {
    "a": "add",
    "ap": "add -p",
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
    "r": "reset",
    "rb": "rebase",
    "rbi": "rebase --interactive",
    "s": "status -s",
    "st": "status",
    "sh": "show",
    "tags": "tag -l -n3",
    "p": "push",
# this is causing problems with thefuck
#   "push": "push --progress -v",
}
for command in _GIT_SUBCOMMANDS.keys():
    _subcommand("git", command, _GIT_SUBCOMMANDS[command])
del _GIT_SUBCOMMANDS
