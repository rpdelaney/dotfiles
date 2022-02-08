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

def define(word):
    execx(f"curl -s dict://dict.org/d:{word}")

abbrevs["emacs"] = "vim"
abbrevs["ix"] = "curl --data-binary @- https://paste.rs"
abbrevs["pager"] = "ifne less -R -X"
#abbrevs["qrcode"] = "curl -F-=\<- qrenco.de"  # this doesn't work because python is dumb about \ in strings
abbrevs["rot13"] = "tr 'A-Za-z' 'N-ZA-Mn-za-m'"
abbrevs["define"] = "define('<edit>')"
abbrevs["sxiv"] = "sxiv -a -p"

_first("ZQ", "exit")
_first("ZZ", "exit")
_first("ch", "cd <edit> && ll")
_first("pw", "pwstore")
_first("keychain", 'keychain --dir "$XDG_DATA_HOME/keychain" --absolute')
_first("mediainfo", "mediainfo --Output=JSON <edit> | jq -C")
_first("jq", "jq -C")

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
    abbrevs["clip"] = "pbcopy"
    abbrevs["paste"] = "pbpaste"
    abbrevs["ya"] = "brew"
    abbrevs["yas"] = "brew install"
    abbrevs["yass"] = "brew search"
    abbrevs["yars"] = "brew uninstall"
    abbrevs["yasyu"] = "brew upgrade"
else:
    abbrevs["clip"] = "xclip -in -selection clipboard"
    abbrevs["paste"] = "xclip -out -selection clipboard"

# python3 one-liners
abbrevs["base64"] = 'python3 -m base64'
abbrevs["uuencode"] = 'python3 -m uu'
_first("filecmp", "python3 -m filecmp")
_first("platform", "python3 -m platform")
_first("modulefinder", "python3 -m modulefinder")
_first("telnet", "python3 -m telnetlib")
_first("ftp", "python3 -m ftplib")
_first("site", "python3 -m site")
