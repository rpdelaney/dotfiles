  " TODO: what is this?
set complete-=i
  " TODO: what is this?
" set display+=lastline
  " update the buffer if the source file changes on disk and we have not edited it
set autoread
  " Enforce 1000 lines of history maximum
if &history < 1000
  set history=1000
endif
  " TODO: Put something in viminfo for some reason
if !empty(&viminfo)
  set viminfo^=!
endif
  " Don't redraw while executing macros (good performance config)
set lazyredraw

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
