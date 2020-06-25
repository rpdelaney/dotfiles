" autocmd BufWritePre <buffer> execute ':Black'

setlocal expandtab shiftwidth=4 softtabstop=4
setlocal completeopt=menuone,preview

let b:python_highlight_all = 1
let b:python_slow_sync = 1

let b:ale_linters = {'python': ['flake8', 'mypy']}

let b:ale_python_flake8_change_directory=1
let b:ale_python_flake8_executable='flake8'

let b:ale_python_mypy_ignore_invalid_syntax = 1

let g:black_linelength = 79

  " call formatter when we hit a key
nnoremap <buffer> <F5> :execute 'Black' <CR>
