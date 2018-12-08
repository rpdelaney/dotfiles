    " stop using arrow keys ya dummy
noremap <left> :echoe "Stop using arrow keys."<cr>
noremap <right> :echoe "Stop using arrow keys."<cr>
noremap <up> :echoe "Stop using arrow keys."<cr>
noremap <down> :echoe "Stop using arrow keys."<cr>
    " Disable Ex mode
map Q <Nop>
    " Disable K looking stuff up
map K <Nop>
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
    " Save the file
if maparg('<c-s>', 's') ==# ''
    noremap <c-s> :w<cr>
endif

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
