"""Completions display is evaluated and presented whenever a key
is pressed.  This avoids the need to press TAB, except to cycle
through the possibilities.  This currently only affects the
prompt-toolkit shell."""
$UPDATE_COMPLETIONS_ON_KEYPRESS = False

"""Mode of tab completion in prompt-toolkit shell (only).

‘default’, the default, selects the common prefix of completions
on first TAB, then cycles through all completions. ‘menu-complete’
selects the first whole completion on the first TAB, then cycles
through the remaining completions, then the common prefix."""
$COMPLETION_MODE = "default"

"""When generating the completions takes time, it’s better to do this in a
background thread. When this is True, background threads is used for completion."""
$COMPLETION_IN_THREAD = True

"""While tab-completions menu is displayed, press <Enter> to confirm completion
instead of running command. This only affects the prompt-toolkit shell."""
$COMPLETIONS_CONFIRM = False

"""Sets whether completions should be case sensitive or case insensitive."""
$CASE_SENSITIVE_COMPLETIONS = False

"""Configure if and how Python completions are displayed by the prompt_toolkit shell."""
$COMPLETIONS_DISPLAY = "multi"

"""Number of rows to reserve for tab-completions menu if $COMPLETIONS_DISPLAY is
single or multi. This only affects the prompt-toolkit shell."""
$COMPLETIONS_MENU_ROWS = 10
