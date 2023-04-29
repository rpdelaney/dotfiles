if &t_Co == 8 && $TERM !~# '^linux'
  let g:gruvbox_termcolors = 16
elseif exists('+termguicolors')
    " See https://vimhelp.org/term.txt.html#xterm-true-color
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

  " Disable background color erase - this could cause bugs in some terminals
set t_ut=

  " Indent guides colors for gruvbox scheme
  " the autocmd's are probably better using 'let'
  " or just put all this in /after/ftplugin
let g:indent_guides_auto_colors = 0
let g:indent_guides_size = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#32302f   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2c2a29   ctermbg=4

" EOF
