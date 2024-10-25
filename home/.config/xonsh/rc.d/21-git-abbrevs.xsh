xontrib load abbrevs

_first("g", "git")
_first("it", "git")
_first("gti", "git")
_first("git stashes", "git stash --list")
abbrevs["groot"] = lambda buffer, word: $(git rev-parse --show-toplevel).strip()
abbrevs["ghash"] = lambda buffer, word: $(git rev-parse HEAD).strip()
abbrevs["gbranch"] = lambda buffer, word: $(git rev-parse --abbrev-ref HEAD).strip()

_GIT_SUBCOMMANDS = {
    "a": "add",
    "ap": "add --patch",
    "br": "branch -v",
    "bra": "branch -v -a",
    "c": "commit -v",
    "clean": r"""branch --merged | grep -Ev r'(^\*|master|main|dev)' | xargs git branch -d  # delete local branches that have merged to main""",
    "co": "checkout",
    "cod": "checkout @$(basename @$(git symbolic-ref refs/remotes/origin/HEAD))  # check out the default branch",
    "ca": "commit --amend",
    "cm": "commit -v -m",
    # "cp": "cherry-pick",  # TODO: this conficts with the "cp" abbrev, fix it
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
    "tags": "tag -l -n3", # "| sort -V", <-- nice idea but this breaks on multi-line tag messages
# I can't stop doing this by accident lol
#   "p": "push",
# this is causing problems with thefuck
#   "push": "push --progress -v",
    "blame": "blame --color-lines --color-by-age",  # until I figure out how to force colors with git-config
}
for _command in _GIT_SUBCOMMANDS.keys():
    _subcommand("git", _command, _GIT_SUBCOMMANDS[_command])

del _GIT_SUBCOMMANDS
del _command
