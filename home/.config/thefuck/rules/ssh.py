#
# try adding ssh-agent if we get pubkey denied
#
from thefuck.utils import for_app


@for_app("ssh")
def match(command):
    return "Permission denied (publickey)." in command.output


def get_new_command(command):
    return f"ssh-add && {command.script}"


priority = 10
enabled_by_default = True
