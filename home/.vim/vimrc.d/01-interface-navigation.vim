  " Permit switching buffers when the current buffer is dirty
set hidden
  " what to do when I hit backspace
set backspace=indent,eol,start
  " don't wrap unless I say so
set nowrap
  " make left/right keys wrap to start of the next line
set whichwrap+=h,l,<,>,[,]
  " how many rows to show on each side of the cursor
  " a large value like 999 will keep the cursor in the center of the screen
set scrolloff=3
  " how many columns to show on each side of the cursor
set sidescrolloff=1
  " Enforce 50 tabs maximum
if &tabpagemax < 50
  set tabpagemax=50
endif

" vim600: set foldmethod=marker foldlevel=0 nolist:
