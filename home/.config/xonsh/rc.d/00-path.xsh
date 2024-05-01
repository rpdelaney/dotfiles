import platform
import os

_prepends = [
    "/bin",
    "/sbin",
    "/usr/bin",
    "/usr/sbin",
    "/usr/local/bin",
    "/usr/sbin",
    "/usr/local/Cellar",
    "/Applications/kitty.app/Contents/MacOS",
    "/opt/homebrew/bin",
    "/opt/homebrew/sbin",
    "/opt/homebrew/opt/asdf/libexec/bin",
    "/opt/homebrew/opt/findutils/libexec/gnubin",
    "/opt/homebrew/opt/gnu-sed/libexec/gnubin",
    "/opt/homebrew/opt/gnu-tar/libexec/gnubin",
    "/opt/homebrew/opt/gnu-which/libexec/gnubin",
    "/opt/homebrew/opt/grep/libexec/gnubin",
    f"{__xonsh__.env['HOME']}/go/bin",
    f"{__xonsh__.env['HOME']}/.gem/ruby/2.6.0/bin",
    f"{__xonsh__.env['HOME']}/.local/share/asdf/shims",
    f"{__xonsh__.env['HOME']}/.local/bin",
    f"{__xonsh__.env['HOME']}/bin",
]

for prepend in _prepends:
    if os.path.isdir(prepend) and prepend not in $PATH:
        $PATH.insert(0, prepend)
del _prepends
