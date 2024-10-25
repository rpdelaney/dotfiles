import sys
from xontrib_commands.argerize import Command

@Command.reg
def up(num=0):
    """Go up any number of directories.
    Based on code from here: https://github.com/oh-my-xonsh/xontrib-up"""
    balloons = ('../' * int(num))
    pushd --quiet @(balloons)
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
def html2md(from_file):
    """An incantation to convert HTML to markdown using pandoc."""
    to_file = from_file
    for extension in (".html", ".htm"):
        to_file = to_file.replace(extension, ".md")
        print(to_file)

    pandoc @(from_file) --from html --to markdown -s -o @(to_file)

@Command.reg
def html2txt(from_file):
    """An incantation to convert HTML to text using pandoc."""
    to_file = from_file
    for extension in (".html", ".htm"):
        to_file = to_file.replace(extension, ".txt")
        print(to_file)

    pandoc @(from_file) --from html --to plain -s -o @(to_file)

@Command.reg
def pdf2txt(from_file):
    """An incantation to convert HTML to text using pandoc."""
    to_file = from_file
    for extension in (".pdf"):
        to_file = to_file.replace(extension, ".txt")
        print(to_file)

    pdftotext -layout @(from_file) @(to_file)

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

@Command.reg
def alias(key, value=None):
    """Set a shell alias, or retrieve its value."""
    if value is None:
        try:
            print(f'aliases["{key}"]="{" ".join(aliases[key])}"')
        except KeyError:
            print(f"Error: no such alias `{key}`", file=sys.stdout)
            return 1
    else:
        aliases[key]=value
