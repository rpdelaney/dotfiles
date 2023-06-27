from xonsh.environ import LsColors
__xonsh__.env['LS_COLORS'] = LsColors.fromstring(Path("/home/ryan/.config/xonsh/rc.d/lscolors.txt").read_text())
