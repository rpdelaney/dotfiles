from xonsh.environ import LsColors
__xonsh__.env['LS_COLORS'] = LsColors.fromstring(Path("/Users/ryan/.config/xonsh/rc.d/lscolors.txt").read_text())
