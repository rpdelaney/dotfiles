autocmd FileType autocmd BufWritePre <buffer> Black

setl expandtab shiftwidth=4 softtabstop=4
setl completeopt=preview

let b:python_highlight_all = 1
let b:python_slow_sync = 1

let b:ale_linters = {'python': ['flake8', 'mypy', 'pylint']}
let b:ale_python_flake8_auto_pipenv=1
let b:ale_python_flake8_options = '--doctests'

let b:ale_python_mypy_auto_pipenv=1

let b:ale_python_pylint_auto_pipenv=1
let b:ale_python_pylint_options='--rcfile="~/.config/pylint/config"'

let g:black_linelength = 79
