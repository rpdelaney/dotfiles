"""Deactivate the virtual environment when we leave the project directory."""
@events.autovox_policy
def dotvenv_policy(path, **_):
    venv = path / '.venv'
    if venv.exists():
        return venv
    else:
        return ""
