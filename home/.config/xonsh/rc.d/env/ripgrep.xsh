if !(which rg &>/dev/null):
    _ripgrep_config_path = Path(f"{__xonsh__.env['XDG_CONFIG_HOME']}", "ripgrep.conf")
    $RIPGREP_CONFIG_PATH = str(_ripgrep_config_path)
    del _ripgrep_config_path
