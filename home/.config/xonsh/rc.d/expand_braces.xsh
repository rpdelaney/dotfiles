"""
Implements simple brace expansion:

```console
@ echo a{d,c,b}e
ade ace abe
```

Nested expansion is not supported:

```console
@ echo /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}
SyntaxError: Unmatched "}" at line 1, column 16
```

See also:
* https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html
"""
from xonsh.events import events


@events.on_transform_command
def expand_braces(cmd, **_):
    parts = cmd.split()
    expanded_cmds = []

    for part in parts:
        if "{" in part and "}" in part:
            prefix, braces, postfix = part.partition("{")
            options, _, postfix = postfix.partition("}")
            expanded_parts = [
                prefix + option + postfix for option in options.split(",")
            ]
            expanded_cmds.extend(expanded_parts)
        else:
            expanded_cmds.append(part)

    return " ".join(expanded_cmds)
