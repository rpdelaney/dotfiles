" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
"
  " Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
    " If terminal does not support 256 colors, use Mustang2 instead of zenburn
  set t_Co=16
  colorscheme mustang2
else
    " enable true color support
    " see :h xterm-true-color
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" set termguicolors
    " otherwise, use zenburn
  set t_Co=256
  let g:zenburn_high_contrast=1
  colorscheme zenburn
endif
  " Disable background color erase - this could cause bugs in some terminals
set t_ut=
  " Enable true color support

" EOF
