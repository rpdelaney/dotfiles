#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/

_xontribs = [
    "argcomplete",
    "commands",
    "direnv",
    "jedi",
    "kitty",
    "readable-traceback",
    "whole_word_jumping",
    "vox",
]
if _xontribs:
    xontrib load @(_xontribs)

if platform.system() == "Darwin":
    xontrib load homebrew
