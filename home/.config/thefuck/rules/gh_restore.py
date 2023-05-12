#
# sometimes `gh` fails to do stuff, but it gives a recovery command.
#
# X operation failed. To restore: gh issue create --recover /var/folders...
from thefuck.utils import for_app

error_strings = [
    """operation failed. To restore:"""
]


@for_app("gh")
def match(command) -> bool:
    return any(string in command.output for string in error_strings)


def get_new_command(command) -> str:
    return command.replace("X operation failed. To restore:", "").strip()


enabled_by_default = True
