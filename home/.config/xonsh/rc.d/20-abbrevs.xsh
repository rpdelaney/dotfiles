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

# shell extensions
abbrevs["!!"] = lambda buffer, word: __xonsh__.history[-1].cmd.strip()
abbrevs["ix"] = "curl -Ss --data-binary @- https://paste.rs"
abbrevs["pager"] = "ifne less -r -X -F"

# "aliases" that work better as abbreviations
abbrevs["rot13"] = "tr 'A-Za-z' 'N-ZA-Mn-za-m'"
abbrevs["feh"] = "nsxiv --animate --private --recursive --thumbnail --zoom-100 --stdout"
abbrevs["rmlint"] = "rmlint -c sh:clone <edit>  # -c sh:clone forces deduplication"
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

_first("chgrp", "chgrp -c")
_first("chmod", "chmod -c")
_first("chown", "chown -c")
_first("mkdir", "mkdir -v")
_first("cp", "cp -v -i --reflink=auto")
_first("mv", "mv -v -i")
_first("rm", "rm -v --interactive=once")
_first("rmdir", "rmdir -v")

_first("la", "ll -a")
_first("lll", f"ll <edit>| {abbrevs['pager']}")
_first("lla", f"ll -a <edit>")
_first("llla", f"ll -a <edit>| {abbrevs['pager']}")
_first("lt", f"ll -a -T -L 2")

# Do different stuff when we are on macOS
if platform.system() == "Darwin":
    abbrevs["ya"] = "brew"
    abbrevs["yas"] = "brew install"
    abbrevs["yass"] = "brew search"
    abbrevs["yars"] = "brew uninstall"
    abbrevs["yasyu"] = "brew upgrade"
else:
    if ret := !(which paru):
        pkgman = "paru --color always"
        abbrevs["paru"] = f"paru --color always"
    else:
        pkgman = "pacman --color always"
    del ret

    abbrevs["ya"]       = f"{pkgman}"
    abbrevs["yas"]      = f"{pkgman} -S"
    abbrevs["yass"]     = f"{pkgman} -Ss"
    abbrevs["yars"]     = f"{pkgman} -Rs"
    abbrevs["yeet"]     = abbrevs["yars"]
    abbrevs["yasyu"]    = f"{pkgman} -Syu"
    abbrevs["yaclean"]  = f"{pkgman} -Rs @$(pacman -Qtdq)"
    try:
        del pkgman
    except NameError:
        pass
