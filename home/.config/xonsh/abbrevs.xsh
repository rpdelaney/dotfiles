xontrib load abbrevs

def _first(word, sub):
    """Perform the substitution if and only if the command is the first word on the line."""
    abbrevs[word] = lambda buffer, word: sub if buffer.text.startswith(word) else word

_first("ZQ", "exit")
_first("ZZ", "exit")
_first("ch", "cd <edit> && ll")
_first("chgrp", "chgrp --changes")
_first("chmod", "chmod --changes")
_first("chown", "chown --changes")
_first("mkdir", "mkdir --verbose")
_first("cp", "cp --verbose --interactive --reflink=auto")
_first("mv", "mv --verbose --interactive")
_first("pw", "pwstore")
_first("rm", "rm --verbose --interactive=once")
