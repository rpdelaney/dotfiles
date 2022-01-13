from xontrib.commands import Command
@Command.reg
def record_stats(pkg_name=".", path=".local/stats.txt"):
    stat = $(scc @(pkg_name))
    echo @($(date) + stat) | tee -a @(path)

@Command.reg
def up(num=0):
    """Go up any number of directories.
    Based on code from here: https://github.com/oh-my-xonsh/xontrib-up"""
    balloons = ('../' * int(num))
    cd @(balloons)
    execx("ll")
