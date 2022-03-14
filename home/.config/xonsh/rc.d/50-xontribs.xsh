#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/
#   https://pypi.org/project/xontrib-history-encrypt/

_xontribs = [
    "argcomplete",
    "commands",
    "direnv",
    "jedi",
    "kitty",
    "readable-traceback",
    "thefuck",
    "whole_word_jumping",
    "vox",
#   "history-encrypt",  # I always get "is not installed" error with this?
]
if _xontribs:
    xontrib load @(_xontribs)

if platform.system() == "Darwin":
    xontrib load homebrew
