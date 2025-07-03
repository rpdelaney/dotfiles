import os
import sys

from pathlib import Path


if !(which eza &>/dev/null):
    homedir = next(x for x in (os.getenv('XDG_HOME'), os.getenv('HOME'), "/home/ryan/",) if x is not None)
    cfgdir = next(x for x in (os.getenv('XDG_CONFIG_HOME'), f"{homedir}/.config/",) if x)
    lscolors_path = Path(f"{cfgdir}/xonsh/rc.d/lscolors.txt")

    try:
        if lscolors_data := lscolors_path.read_text():
            __xonsh__.env['EZA_COLORS'] = lscolors_data
        del lscolors_data
    except FileNotFoundError as fnf:
        print(f"Can't load EZA_COLORS. File not found: {str(lscolors_path)}", file=sys.stderr)

    del lscolors_path
