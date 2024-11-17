#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/
#   https://pypi.org/project/xontrib-output-search/
import os

_xontribs = [
    ("abbrevs", "xontrib-abbrevs"),
    ("argcomplete", "xontrib-argcomplete"),
    ("autovox", "xontrib-vox"),
    ("avox_poetry", "xontrib-avox-poetry"),
    ("commands", "xontrib-commands"),
    ("direnv", "xonsh-direnv"),
    ("expand_braces", "xontrib-expand-braces"),
    ("gruvbox", "xontrib-gruvbox"),
    ("jedi", "xontrib-jedi"),
    ("vox", "xontrib-vox"),
    ("whole_word_jumping", "xontrib-whole-word-jumping"),
]

def _xontrib_load(xontr, pkg):
    result = !(xontrib load @(xontr))

    if result.returncode != os.EX_OK:
        print(f"Failed loading xontrib: {xontr} {repr(result.returncode)}")
        if pkg:
            print(f"Try: xpip install {pkg}")

for _xontrib, _pkg in _xontribs:
    _xontrib_load(_xontrib, _pkg)

del _xontrib_load
del _xontribs
del _xontrib
del _pkg
