    " time out bindings that don't respond quickly
set ttimeout
set ttimeoutlen=50
    " Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-n>', 'n') ==# ''
  nnoremap <silent> <C-n> :nohlsearch<CR><C-L>
endif
    " Editing a protected file as 'sudo'
" cmap W w !sudo tee % >/dev/null<CR>
    " More easily navigate tabs
noremap <c-l> :bn<cr>
noremap <c-h> :bp<cr>
    " Copy-paste mode
noremap <silent> <c-c> :GitGutterToggle <CR>:set nolist nonumber relativenumber! wrap! <CR>
noremap <silent> <c-p> :set list paste! <CR> <Insert>
    " Pairing mode
noremap <silent> <F4> :set number! relativenumber! <CR>
    " fold/unfold
noremap <silent> <F7> :set foldlevel=1 <CR>
noremap <silent> <F8> :set foldlevel=999 <CR>
    " Save the file
if maparg('<c-s>', 's') ==# ''
    noremap <c-s> :w<cr>
endif
