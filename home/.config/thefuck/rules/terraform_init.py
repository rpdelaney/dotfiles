#
# when doing 'terraform plan' if we have not done 'terraform init' there will
# be an error. handle it here
#
from thefuck.utils import for_app

needs_init_strings = [
    "initialization required",
    """run "terraform init" to install all modules""",
    """please run "terraform init".""",
]


@for_app("terraform", "tf")
def match(command):
    return any(
        string.lower() in command.output for string in needs_init_strings
    )


def get_new_command(command):
    return f"{command.script_parts[0]} init && {command.script}"


enabled_by_default = True
