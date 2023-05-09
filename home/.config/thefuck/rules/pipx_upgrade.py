"""
If we try to pipx upgrade something we don't even have installed,
suggest installing it.
"""
import re
from thefuck.utils import for_app


@for_app("pipx")
def match(command):
    return "Package is not installed." in command.output


def get_new_command(command):
    package_name = re.search(
        r"/Users/.*?/pipx/venvs/(.*),", command.output
    ).group(1)
    return f"pipx install {package_name}"
