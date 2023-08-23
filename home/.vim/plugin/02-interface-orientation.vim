set ruler          " Tell me where I am in the file
set relativenumber " show line numbers relative to the cursor position
set nonumber       " don't show line numbers in absolute terms
set cursorline     " highlight current row
set nocursorcolumn

" Set different cursor shape for modes
let &t_SI = "\<Esc>]12;#689d6a\007\<Esc>[5 q"   " Insert mode, blinking green pipe
let &t_EI = "\<Esc>]12;#a89984\007\<Esc>[1 q"   " Normal mode, blinking grey block
let &t_SR = "\<Esc>]12;#cc241d\007\<Esc>[3 q"   " Replace mode, blinking red underscore
