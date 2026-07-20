xontrib load abbrevs

_first("g", "git")
_first("it", "git")
_first("gti", "git")
_first("git stashes", "git stash --list")
abbrevs["groot"] = lambda buffer, word: $(git rev-parse --show-toplevel).strip()
abbrevs["ghash"] = lambda buffer, word: $(git rev-parse HEAD).strip()
abbrevs["gbranch"] = lambda buffer, word: $(git rev-parse --abbrev-ref HEAD).strip()
abbrevs["gittop"] = lambda buffer, word: $(git rev-parse --show-toplevel)

_GIT_SUBCOMMANDS = {
    "a": "add",
    "ap": "add --patch",
    "br": "branch --no-abbrev",
    "bra": "branch --no-abbrev --all",
    "c": "commit --verbose",
    "clean": r"""branch --merged | grep -Ev r'(^\*|master|main|dev)' | xargs git branch --delete # delete local branches that have merged to main""",
    "co": "checkout",
    "cod": "checkout @$(basename @$(git symbolic-ref refs/remotes/origin/HEAD))  # check out the default branch",
    "ca": "commit --amend",
    "cm": "commit --verbose --message",
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
    "remotes": "remote --verbose",
    "rb": "rebase",
    "rbi": "rebase --interactive",
    "s": "status --short",
    "st": "status",
    "sh": "show",
    "tags": "tag -l -n3 --sort=-version:refname",
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
