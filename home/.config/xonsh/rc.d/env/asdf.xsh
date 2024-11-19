from pathlib import Path

if !(which asdf &>/dev/null):
    _asdf_config_path = Path(f"{__xonsh__.env['XDG_CONFIG_HOME']}", "asdf", "config")
    $ASDF_CONFIG_FILE = str(_asdf_config_path)
    del _asdf_config_path

    _asdf_data_path = Path(f"{__xonsh__.env['XDG_DATA_HOME']}", "asdf")
    $ASDF_DATA_DIR = str(_asdf_data_path)
    del _asdf_data_path

    _asdf_python_default_pkg_path = Path(f"{__xonsh__.env['XDG_DATA_HOME']}", "pip", "default-python-packages")
    $ASDF_PYTHON_DEFAULT_PACKAGES_FILE = str(_asdf_python_default_pkg_path)
    del _asdf_python_default_pkg_path
