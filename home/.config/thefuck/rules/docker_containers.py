def match(command):
    return "docker: 'containers' is not a docker command." in command.output

def get_new_command(command):
    return 'docker container list'

enabled_by_default = True
