# autoplay youtube ids in mpv
from thefuck.utils import for_app
import re

_PATTERN=r"^\[file\] Cannot open file '([0-9A-Za-z_-]{11,})': No such file or directory"
_prog = re.compile(_PATTERN)

@for_app("mpv")
def match(command):
    return _prog.match(command.output)

def get_new_command(command):
    match = _prog.match(command.output)
    ytid = match.group(1)
    return command.script.replace(ytid, f'https://youtu.be/{ytid}')

enabled_by_default = True
