xontrib load abbrevs

_first("t", "terraform")

_TF_SUBCOMMANDS = {
    "in": "init -input=false",
    "inu": "init -input=false -upgrade",
    "inr": "init -input=false -reconfigure",
    "im": "import -input=false",
    "p": "plan -input=false",  # TODO: figure out how to do -out=planfile
    # "s": "show...",  # TODO
    "a": "apply -input=false",
    "v": "version -json | jq",
    "f": "fmt -diff -recursive",
}

# for _command in _TF_SUBCOMMANDS.keys():
#    _subcommand("terraform", _command, _TF_SUBCOMMANDS[_command])

# del _command
del _TF_SUBCOMMANDS
