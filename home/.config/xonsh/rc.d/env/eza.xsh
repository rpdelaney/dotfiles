import os

if !(which eza &>/dev/null):
    __xonsh__.env['EZA_COLORS'] = Path(f"{os.getenv('XDG_CONFIG_HOME')}/xonsh/rc.d/lscolors.txt").read_text()
