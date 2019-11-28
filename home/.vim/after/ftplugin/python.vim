autocmd BufWritePre <buffer> execute ':Black'

setlocal expandtab shiftwidth=4 softtabstop=4
setlocal completeopt=preview

let b:python_highlight_all = 1
let b:python_slow_sync = 1

let b:ale_linters = {'python': ['flake8', 'mypy', 'pylint', 'bandit']}

let b:ale_python_flake8_auto_pipenv=1
let b:ale_python_flake8_options = '--doctests'
let b:ale_python_flake8_change_directory = 1

let b:ale_python_bandit_auto_pipenv = 1

let b:ale_python_mypy_auto_pipenv = 1
let b:ale_python_mypy_ignore_invalid_syntax = 1

let b:ale_python_pylint_auto_pipenv=1
let b:ale_python_pylint_options='--rcfile="~/.config/pylint/config"'

let g:black_linelength = 79

  " call formatter when we hit a key
nnoremap <buffer> <F5> :execute 'Black' <CR>
