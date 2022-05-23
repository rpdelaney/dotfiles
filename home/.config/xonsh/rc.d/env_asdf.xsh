from pathlib import Path

_asdf_config_path = Path(f"{$XDG_CONFIG_HOME}", "asdf", "asdfrc")
if _asdf_config_path.is_file():
    $ASDF_CONFIG_FILE = str(_asdf_config_path)
del _asdf_config_path

_asdf_data_path = Path(f"{$XDG_DATA_HOME}", "asdf")
if _asdf_data_path.is_dir():
    $ASDF_DATA_DIR = str(_asdf_data_path)
del _asdf_data_path

_asdf_python_default_pkg_path = Path(f"{$XDG_DATA_HOME}", "pip", "default-python-packages")
if _asdf_python_default_pkg_path.is_file():
    $ASDF_PYTHON_DEFAULT_PACKAGES_FILE = str(_asdf_python_default_pkg_path)
del _asdf_python_default_pkg_path
