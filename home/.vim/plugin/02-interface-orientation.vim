set ruler          " Tell me where I am in the file
set relativenumber " show line numbers relative to the cursor position
set nonumber       " don't show line numbers in absolute terms
set cursorline     " highlight current row
set nocursorcolumn

" Set different cursor shape for modes
let &t_SI = "\<Esc>]12;#53a7e0\007\<Esc>[5 q"   " Insert mode, blinking blue pipe
let &t_EI = "\<Esc>]12;#a89984\007\<Esc>[1 q"   " Normal mode, blinking grey block
let &t_SR = "\<Esc>]12;#e2401f\007\<Esc>[3 q"   " Replace mode, blinking red underscore

autocmd VimEnter * silent execute "!echo -ne '\e[1 q'"
autocmd VimLeave * silent execute "!echo -ne '\e[ q'"
