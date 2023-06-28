import os
from xonsh.environ import LsColors
__xonsh__.env['LS_COLORS'] = LsColors.fromstring(Path(f"{os.getenv('XDG_CONFIG_HOME')}/xonsh/rc.d/lscolors.txt").read_text())
