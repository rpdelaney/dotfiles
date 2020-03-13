# autoplay youtube ids in mpv
import re

_PATTERN=r"^\[file\] Cannot open file '([0-9A-Za-z_-]+)': No such file or directory"
_prog = re.compile(_PATTERN)

def match(command):
    return _prog.match(command.output)

def get_new_command(command):
    match = _prog.match(command.output)
    ytid = match.group(1)
    return command.script.replace(ytid, f'https://youtu.be/{ytid}')

enabled_by_default = True
