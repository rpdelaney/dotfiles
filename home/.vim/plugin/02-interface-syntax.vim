  " if we have syntax, use it
if has('syntax') && !exists('g:syntax_on')
  syntax enable
    " use syntax engine to control folding
  set foldmethod=syntax
endif
