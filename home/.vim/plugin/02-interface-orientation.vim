set ruler          " Tell me where I am in the file
set relativenumber " show line numbers relative to the cursor position
set nonumber       " don't show line numbers in absolute terms
set cursorline     " highlight current row
set nocursorcolumn

" Set different cursor shape for modes
let &t_SI = "\e[5 q" " Insert mode
let &t_EI = "\e[2 q" " Normal mode
let &t_SR = "\e[4 q" " Replace mode
