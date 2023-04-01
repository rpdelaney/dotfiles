#
# `docker images` is a thing, but `docker containers` isn't because of reasons
#
from thefuck.utils import for_app


@for_app("docker")
def match(command):
    return "docker: 'containers' is not a docker command." in command.output


def get_new_command(command):
    return "docker container list"


enabled_by_default = True
priority = 10  # I need this to run before the built-in rules
