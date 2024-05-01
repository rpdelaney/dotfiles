from pathlib import Path

_gpg_path = Path(f"{__xonsh__.env['XDG_CONFIG_HOME']}", "gnupg2")
if _gpg_path.is_dir():
    $GNUPGHOME = str(_gpg_path)
del _gpg_path
