set hidden                     " Permit switching buffers when the current buffer is dirty
set backspace=indent,eol,start " what to do when I hit backspace
set nowrap                     " don't wrap unless I say so
set whichwrap+=h,l,<,>,[,]     " make left/right keys wrap to start of the next line
set scrolloff=3                " how many rows to show on each side of the cursor
set sidescrolloff=1            " how many columns to show on each side of the cursor

if &tabpagemax < 50            " Enforce 50 tabs maximum
  set tabpagemax=50
endif
