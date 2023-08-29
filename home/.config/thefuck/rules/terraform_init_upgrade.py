import re

from thefuck.shells import shell
from thefuck.utils import for_app


def strip_ansi_codes(text):
    ansi_escape = re.compile(r"\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])")
    return ansi_escape.sub("", text)


@for_app("terraform")
def match(command):
    stripped_output = strip_ansi_codes(command.output)
    return "Inconsistent dependency lock file" in stripped_output


def get_new_command(command):
    return shell.and_("terraform init -upgrade", command.script)


enabled_by_default = True
