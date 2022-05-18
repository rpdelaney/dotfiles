from xontrib.commands import Command

@Command.reg
def record_stats(pkg_name=".", path=".local/stats.txt"):
    """Wtf does this do? I have no memory of making it."""
    stat = $(scc @(pkg_name))
    echo @($(date) + stat) | tee -a @(path)

@Command.reg
def up(num=0):
    """Go up any number of directories.
    Based on code from here: https://github.com/oh-my-xonsh/xontrib-up"""
    balloons = ('../' * int(num))
    cd @(balloons)
    ll

@Command.reg
def md2rst(from_file):
    """An incantation to convert markdown to RST using pandoc."""
    to_file = from_file
    for extension in (".md", ".MD", ".markdown"):
        to_file = to_file.replace(extension, ".rst")
        print(to_file)

    pandoc @(from_file) --from markdown --to rst -s -o @(to_file)

@Command.reg
def rst2md(from_file):
    """An incantation to convert RST to markdown using pandoc."""
    to_file = from_file
    for extension in (".rst", ".RST"):
        to_file = to_file.replace(extension, ".md")
        print(to_file)

    pandoc @(from_file) --from rst --to markdown -s -o @(to_file)


@Command.reg
def define(word):
    p = !(curl -Ss f"dict://dict.org/d:{word}")

    for line in p:
        if len(line.strip()) == 0:
            print(line, end="")
            continue

        try:
            int(line[0:3])
        except ValueError:
            print(line, end="")
        else:
            continue
