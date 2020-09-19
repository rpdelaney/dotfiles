#
# I'd rather use pipx to install things outside of a virtualenv
#
from thefuck.utils import for_app
from thefuck.specific.sudo import sudo_support

needs_venv_strings = [
    """ERROR: Could not find an activated virtualenv (required)."""
]


@sudo_support
@for_app("pip", "pip3")
def match(command):
    return "install" == command.script_parts[1] and any(
        string in command.output for string in needs_venv_strings
    )


def get_new_command(command):
    return "pipx install {}".format(" ".join(command.script_parts[2:]))


enabled_by_default = True
