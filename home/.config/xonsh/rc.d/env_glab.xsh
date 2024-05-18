# configuration for gitlab-cli

# GITLAB_TOKEN: An authentication token for API requests. Set this variable to
# avoid prompts to authenticate. Overrides any previously-stored credentials.
# Can be set in the config with 'glab config set token xxxxxx'.
$GITLAB_TOKEN=""  # set this in private.xsh

# GITLAB_HOST or GL_HOST: Specify the URL of the GitLab server if self-managed.
# (Example: https://gitlab.example.com) Defaults to https://gitlab.com.

# REMOTE_ALIAS or GIT_REMOTE_URL_VAR: A 'git remote' variable or alias that contains
# the GitLab URL. Can be set in the config with 'glab config set remote_alias origin'.

# VISUAL, EDITOR (in order of precedence): The editor tool to use for authoring text.
# Can be set in the config with 'glab config set editor vim'.

# BROWSER: The web browser to use for opening links.
# Can be set in the config with 'glab config set browser mybrowser'.

# GLAMOUR_STYLE: The environment variable to set your desired Markdown renderer style.
# Available options: dark, light, notty. To set a custom style, read
# https://github.com/charmbracelet/glamour#styles
$GLAMOUR_STYLE="dark"

#  NO_PROMPT: Set to 1 (true) or 0 (false) to disable or enable prompts.

#  NO_COLOR: Set to any value to avoid printing ANSI escape sequences for color output.

#  FORCE_HYPERLINKS: Set to 1 to force hyperlinks in output, even when not outputting to a TTY.

# GLAB_CONFIG_DIR: Set to a directory path to override the global configuration location.
