#
# Xontribs  |  Official list - https://xon.sh/xontribs.html  |  Github topic with thumbnails - https://github.com/topics/xontrib
#
# TODO:
#   https://pypi.org/project/xontrib-termcolors/

xontrib load --verbose argcomplete
xontrib load --verbose autovox
xontrib load --verbose avox_poetry
xontrib load --verbose commands
xontrib load --verbose direnv
xontrib load --verbose jedi
xontrib load --verbose kitty
xontrib load --verbose prompt_starship
xontrib load --verbose readable-traceback
xontrib load --verbose thefuck
xontrib load --verbose vox
xontrib load --verbose whole_word_jumping

if platform.system() == "Darwin":
    xontrib load homebrew
