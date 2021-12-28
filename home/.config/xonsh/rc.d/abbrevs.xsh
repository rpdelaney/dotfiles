xontrib load abbrevs

def _first(word, sub):
    """Perform the substitution if and only if the command is the first word on the line."""
    abbrevs[word] = lambda buffer, word: sub if buffer.text.startswith(word) else word

_first("ZQ", "exit")
_first("ZZ", "exit")
_first("ch", "cd <edit> && ll")
_first("pw", "pwstore")
_first("keychain", 'keychain --dir "$XDG_DATA_HOME/keychain" --absolute')

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
