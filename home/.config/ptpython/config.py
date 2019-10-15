from __future__ import unicode_literals
from prompt_toolkit.filters import ViInsertMode  # noqa
from prompt_toolkit.key_binding.key_processor import KeyPress  # noqa
from prompt_toolkit.keys import Keys  # noqa
from pygments.token import Token  # noqa

from ptpython.layout import CompletionVisualisation

__all__ = ("configure",)


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    repl.show_signature = True
    repl.show_docstring = True
    repl.show_meta_enter_message = True
    repl.completion_visualisation = CompletionVisualisation.MULTI_COLUMN
    repl.completion_menu_scroll_offset = 0
    repl.show_line_numbers = False
    repl.show_status_bar = True
    repl.show_sidebar_help = True
    repl.highlight_matching_parenthesis = True
    repl.wrap_lines = True
    repl.enable_mouse_support = False
    repl.complete_while_typing = True
    repl.enable_fuzzy_completion = True
    repl.enable_dictionary_completion = False
    repl.vi_mode = True
    repl.paste_mode = False
    repl.prompt_style = "classic"
    repl.insert_blank_line_after_output = False
    repl.enable_history_search = False
    repl.enable_auto_suggest = False
    repl.enable_open_in_editor = True
    repl.enable_system_bindings = True
    repl.confirm_exit = False
    repl.enable_input_validation = True
    repl.use_code_colorscheme("monokai")
    # repl.color_depth = 'DEPTH_1_BIT'  # Monochrome.
    # repl.color_depth = 'DEPTH_4_BIT'  # ANSI colors only.
    # repl.color_depth = 'DEPTH_8_BIT'  # The default, 256 colors.
    repl.color_depth = "DEPTH_24_BIT"  # True color.
    repl.enable_syntax_highlighting = True
