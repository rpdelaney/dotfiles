def _command_exists(cmd: str) -> bool:
    x = !(command -v f"{cmd}")
    return x.returncode
