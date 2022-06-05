#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/

_xontribs = [
    "argcomplete",
    "autovox",
    "avox_poetry",
    "commands",
    "direnv",
    "jedi",
    "kitty",
    "prompt_starship",
    "readable-traceback",
    "vox",
    "whole_word_jumping",
]
for _xontrib in _xontribs:
    xontrib load _xontrib

if platform.system() == "Darwin":
    xontrib load homebrew
