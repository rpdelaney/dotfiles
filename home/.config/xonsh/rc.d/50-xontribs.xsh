#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
_xontribs = [
    "argcomplete",
    "kitty",
    "direnv",
    "readable-traceback",
    "whole_word_jumping",
    "thefuck",
#   "history-encrypt",  # I always get "is not installed" error with this?
]
if _xontribs:
    xontrib load @(_xontribs)

if platform.system() == "Darwin":
    xontrib load homebrew
