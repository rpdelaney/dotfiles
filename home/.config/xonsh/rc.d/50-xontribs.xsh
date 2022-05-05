#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/

_xontribs = [
    "argcomplete",
    "autovox",
    "commands",
    "direnv",
    "jedi",
    "kitty",
    "prompt_starship",
    "readable-traceback",
    "vox",
    "whole_word_jumping",
]
if _xontribs:
    xontrib load @(_xontribs)

if platform.system() == "Darwin":
    xontrib load homebrew
