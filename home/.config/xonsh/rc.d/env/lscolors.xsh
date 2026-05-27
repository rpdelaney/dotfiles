import os
import sys

from pathlib import Path


lscolors_path = Path(f"{cfgdir}/xonsh/rc.d/lscolors.txt")

try:
    if lscolors_data := lscolors_path.read_text():
        __xonsh__.env['LS_COLORS'] = lscolors_data
    del lscolors_data
except FileNotFoundError as fnf:
    print(f"Can't load LS_COLORS. File not found: {str(lscolors_path)}", file=sys.stderr)

del lscolors_path
