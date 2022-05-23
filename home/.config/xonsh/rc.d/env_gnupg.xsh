from pathlib import Path

_gpg_path = Path(f"{$XDG_CONFIG_HOME}", "gnupg")
if _gpg_path.is_dir():
    $GNUPGHOME = str(_gpg_path)
del _gpg_path
