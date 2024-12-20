#!/usr/bin/env xonsh
#
"""Also source .xsh files in subdirectories of the xonsh rc.d"""
from pathlib import Path


rcd_dir = Path("/home/ryan/.config/xonsh/rc.d")

for file in [
    str(path) for path in rcd_dir.rglob("*.xsh") if path.parent != rcd_dir
]:
    execx(f"source {file}")

del rcd_dir
del file
