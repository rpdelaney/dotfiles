if !(which wine &>/dev/null):
    # hide fixme messages
    $WINEDEBUG="fixmel-all"

    # don't overwrite file associations
    # https://wiki.winehq.org/FAQ#How_can_I_prevent_Wine_from_changing_the_filetype_associations_on_my_system_or_adding_unwanted_menu_entries.2Fdesktop_links.3F
    $WINEDLLOVERRIDES="winemenubuilder.exe=d"
