xontrib load abbrevs


def _first(word, sub):
    """Perform the substitution if and only if the command is the first word on the line."""
    abbrevs[word] = lambda buffer, word: sub if buffer.text.startswith(word) else word


def _subcommand(command, subcommand, sub):
    """If and only if the first word on the line is 'command', add substitute 'subcommand' with 'sub'"""
    abbrevs[subcommand] = (
        lambda buffer, word: sub
        if buffer.text.startswith(command) and buffer.text.split()[1] == subcommand
        else word
    )

# my common mistakes and typos
_subcommand("poetry", "upgrade", "update")
_subcommand("docker", "containers", "container list")
_subcommand("glab", "pr", "mr")
abbrevs["terrafrom"] = "terraform"
abbrevs["ptpythno"] = "ptpython"
abbrevs["pythno"] = "python"
abbrevs["emacs"] = "nvim"
abbrevs["vim"] = "nvim"
abbrevs["vimdiff"] = "nvim -d"
abbrevs["swaymsg -t show_tree"] = "swaymsg -t get_tree"
abbrevs["arpscan"] = "arp-scan"

# shell extensions
abbrevs["!!"] = lambda buffer, word: __xonsh__.history[-1].cmd.strip()
abbrevs["gitbranch"] = lambda buffer, word: $(git rev-parse --abbrev-ref HEAD).strip()
abbrevs["gitorigin"] = lambda buffer, word: $(git remote get-url origin).strip()
abbrevs["ix"] = "curl -Ss --data-binary @- https://paste.rs"
abbrevs["pager"] = "ifne less -r -X -F"

# "aliases" that work better as abbreviations
abbrevs["rot13"] = "tr 'A-Za-z' 'N-ZA-Mn-za-m'"
_first("rmlint", "rmlint -c sh:clone <edit>  # -c sh:clone forces deduplication")
_first("systemctl", "systemctl --no-ask-password")
_first("xpip", "pipx inject xonsh")
abbrevs["tw"] = "taskwarrior-tui"

_first("ZQ", "exit")
_first("ZZ", "exit")
_first("pw", "pwstore")
_first("keychain", 'keychain --agents "gpg,ssh" --dir "$XDG_DATA_HOME/keychain" --absolute')
_first("mediainfo", "mediainfo --Output=JSON <edit> | jq -C")
_first("jq", "jq -C")
_first("pc", "pre-commit")
_first("find", "find -executable")

_first("chgrp", "chgrp -c")
_first("chmod", "chmod -c")
_first("chown", "chown -c")
_first("mkdir", "mkdir -v")
_first("cp", "cp -v -i --reflink=auto")
_first("mv", "mv -v -i")
_first("rm", "rm -v --interactive=once")
_first("rmdir", "rmdir -v")

_first("la", "ll --all")
_first("llg", "ll --git-ignore")
_first("lll", f"ll <edit>| {abbrevs['pager']}")
_first("lla", f"ll --all <edit>")
_first("llla", f"ll --all <edit>| {abbrevs['pager']}")
_first("lt", f"ll --all --tree --level 3 --git-ignore")

abbrevs["sudo"] = "/usr/sbin/sudo"
abbrevs["su"] = "/usr/sbin/su"
abbrevs["systemctl"] = "/usr/sbin/systemctl"

if pkgman := $(which pacman 2>/dev/null):
    abbrevs["pacman"] = f"{pkgman} --color always"
if aurman := $(which paru 2>/dev/null):
    abbrevs["paru"] = f"{aurman} --color always"

if aurman:
    pkgman = aurman

if len(pkgman):
    abbrevs["ya"]       = f"{pkgman}"
    abbrevs["yas"]      = f"{pkgman} -S"
    abbrevs["yass"]     = f"{pkgman} -Ss"
    abbrevs["yars"]     = f"{pkgman} -Rs"
    abbrevs["yeet"]     = abbrevs["yars"]
    abbrevs["yasyu"]    = f"{pkgman} -Syu"
    abbrevs["yaclean"]  = f"{pkgman} -Rs @$(/usr/bin/pacman -Qtdq)"

# Do different stuff when we are on macOS
if platform.system() == "Darwin":
    if pkgman := $(which brew 2>/dev/null):
        abbrevs["ya"] = f"{pkgman}"
        abbrevs["yas"] = f"{pkgman} install"
        abbrevs["yass"] = f"{pkgman} search"
        abbrevs["yars"] = f"{pkgman} uninstall"
        abbrevs["yasyu"] = f"{pkgman} upgrade"

try:
    del pkgman
    del aurman
    del sudopath
except NameError:
    pass
