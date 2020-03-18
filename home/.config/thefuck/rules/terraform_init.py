#
# when doing 'terraform plan' if we have not done 'terraform init' there will
# be an error. handle it here
#
from thefuck.utils import for_app

needs_init_strings = [
    "Initialization required",
    """Run "terraform init" to install all modules""",
    """Please run "terraform init".""",
]


@for_app("terraform")
def match(command):
    return any([string in command.output for string in needs_init_strings])


def get_new_command(command):
    return "terraform init && {}".format(command.script)


enabled_by_default = True
