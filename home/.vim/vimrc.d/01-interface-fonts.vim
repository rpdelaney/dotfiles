if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata-g\ 14
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 nolist:
