from thefuck.utils import for_app


pre_installed_strings = [
    "already seems to be installed.",
    "Pass '--force' to force installation.",
]


@for_app("pipx")
def match(command):
    return any(
        string in command.output.lower() for string in pre_installed_strings
    )


def get_new_command(command):
    return "{} {}".format(command.script, "--force")
