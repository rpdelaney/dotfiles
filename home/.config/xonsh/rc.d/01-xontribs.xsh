#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/
import os

_xontribs = [
    "abbrevs",
    "argcomplete",
    "autovox",
    "avox_poetry",
    "commands",
    "direnv",
    "jedi",
    "kitty",
    "prompt_starship",
    "readable-traceback",
    "thefuck",
    "vox",
    "whole_word_jumping",
]

def _xontrib_load(xontr):
    result = !(xontrib load @(xontr))

    if result.returncode != os.EX_OK:
        print(f"Failed loading xontrib: {xontr} {repr(result.returncode)}")

for _xontrib in _xontribs:
    _xontrib_load(_xontrib)

if platform.system() == "Darwin":
    _xontrib_load("homebrew")

del _xontrib_load
del _xontribs
del _xontrib
