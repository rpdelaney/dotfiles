set ruler          " Tell me where I am in the file
set relativenumber " show line numbers relative to the cursor position
set nonumber       " don't show line numbers in absolute terms
set cursorline     " highlight current row
set nocursorcolumn

" Set different cursor shape for modes
let &t_SI = "\<Esc>]12;red\007\<Esc>[5 q"   " Insert mode
let &t_EI = "\<Esc>]12;grey\007\<Esc>[2 q"  " Normal mode
let &t_SR = "\<Esc>]12;green\007\<Esc>[4 q" " Replace mode
