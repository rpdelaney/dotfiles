# The SQLite history backend saves command immediately
# unlike JSON backend that save the commands at the end of the session.
$XONSH_HISTORY_BACKEND = "sqlite"

"""
What commands are saved to the history list. By default all commands are saved.
* The option ‘ignoredups’ will not save the command if it matches the previous command.
* The option `erasedups` will remove all previous commands that matches and updates the command frequency.
  The minus of `erasedups` is that the history of every session becomes unrepeatable
  because it will have a lack of the command you repeat in another session.
Docs: https://xon.sh/envvars.html#histcontrol
"""

$HISTCONTROL="ignoredups,ignorespace"
