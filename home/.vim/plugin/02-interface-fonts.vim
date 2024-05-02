if has("gui_running")
  set guifont=Iosevka\ Custom\ 15
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
