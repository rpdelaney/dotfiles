#!/usr/bin/env xonsh
#
"""Run everything in ~/.shellrc to maintain backward compatibility
with the old bash config."""
from pprint import pprint
import os
import stat
import subprocess
from pathlib import Path

from xonsh.aliases import source_foreign

import platform


darwin = platform.system() == "Darwin"


shellrc_dir = os.path.realpath(f"{os.environ['HOME']}/.shellrc.d")
shellrc_dir = Path(Path.home() / Path(".shellrc.d"))

targets = [Path(shellrc_dir, filename) for filename in os.listdir(shellrc_dir)]
executables = sorted(
    list(filter(lambda x: bool(os.stat(x).st_mode & stat.S_IEXEC), targets)),
    key=lambda x: x.name,
)

print("running shellrc executables...")
for filepath in executables:
    file_platform = str(filepath.name).split("-")
    if (
        file_platform == "macos"
        and not platform.system() == "Darwin"
    ):
        print(f"skipping {filepath}")
        continue

    source-bash f"{filepath}" --overwrite-aliases --interactive False
