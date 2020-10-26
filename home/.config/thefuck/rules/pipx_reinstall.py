from thefuck.utils import for_app


reinstall_strings = [
    "pipx: error: argument command: invalid choice: 'reinstall'",
]


@for_app("pipx")
def match(command):
    return any(
        string in command.output.lower() for string in reinstall_strings
    )


def get_new_command(command):
    package = " ".join(command.script_parts[2:])
    return f"pipx uninstall {package} && pipx install {package}"
