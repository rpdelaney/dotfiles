#
# `poetry update` is a thing, but `poetry upgrade` isn't because of reasons
#
from thefuck.utils import for_app


@for_app("poetry")
def match(command):
    return 'The command "upgrade" is not defined.' in command.output


def get_new_command(command):
    return "poetry update"


enabled_by_default = True
