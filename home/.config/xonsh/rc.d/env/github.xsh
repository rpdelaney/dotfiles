if !(which gh &>/dev/null):
    # decline gh-cli telemetry
    $GH_TELEMETRY=0
    # display labels using their RGB hex color codes in terminals that support truecolor.
    $GH_COLOR_LABELS=1
    # disable GitHub CLI update notifications.
    $GH_NO_UPDATE_NOTIFIER=1
    # set to a truthy value to replace the spinner animation with a textual progress indicator.
    $GH_SPINNER_DISABLED=1
