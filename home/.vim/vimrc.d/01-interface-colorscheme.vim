  " Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
    " If terminal does not support 256 colors, use Mustang2 instead of zenburn
  set t_Co=16
  colorscheme mustang2
else
    " otherwise, use zenburn
  set t_Co=256
  let g:zenburn_high_contrast=1
  colorscheme zenburn
endif
  " Disable background color erase - this could cause bugs in some terminals
set t_ut=

" vim600: set foldmethod=marker foldlevel=0 nolist:
