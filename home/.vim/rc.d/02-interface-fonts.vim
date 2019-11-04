if has("gui_running")
  set guifont=Inconsolata-g\ 14
  set guifont=Inconsolata\ Nerd\ Font\ 16
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
