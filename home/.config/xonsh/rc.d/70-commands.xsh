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

@Command.reg
def md2rst(from_file):
    """An incantation to convert markdown to RST using pandoc."""
    to_file = from_file
    for needle in (".md", ".MD", ".markdown"):
        to_file = to_file.replace(needle, ".rst")
        print(to_file)

    pandoc @(from_file) --from markdown --to rst -s -o @(to_file)

@Command.reg
def define(word):
    execx(f"curl -s dict://dict.org/d:{word}")
