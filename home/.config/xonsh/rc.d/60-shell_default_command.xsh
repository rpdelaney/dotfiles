"""Based on code from here:
https://github.com/oh-my-xonsh/xontrib-default-command/blob/main/xontrib/default_command.xsh"""

_DEFAULT_COMMAND="ll"

@events.on_transform_command
def _default_command_transform(cmd):
    """Run a default command when no command is given"""
    if not cmd or cmd.strip() == "":
        return _defaultcmd()
    return cmd

def _defaultcmd():
    if !(git rev-parse):
        newcmd = "git status -s"
    else:
        newcmd = _DEFAULT_COMMAND

    return newcmd
