if has("gui_running")
  set guifont=Inconsolata-g\ 18
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
