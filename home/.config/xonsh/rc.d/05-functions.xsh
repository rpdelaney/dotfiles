def _up(args):
    """Go up any number of directories.
    Based on code from here: https://github.com/oh-my-xonsh/xontrib-up"""
    if not args or len(args) < 1:
        args = [1]
    balloons = ('../' * int(args[0]))
    cd @(balloons)
    execx("ll")

aliases['up'] = _up
