setlocal wrapmargin=0 textwidth=0
setlocal foldmethod=indent foldlevel=999
setlocal expandtab shiftwidth=4 softtabstop=4
setlocal completeopt=menuone,preview

let b:python_highlight_all = 1
let b:python_slow_sync = 1

let b:ale_linters = {'python': ['flake8', 'mypy']}
let b:ale_fixers = {'python': ['black', 'RuffFixer']}
let b:ale_fix_on_save = 0

    " this must be 0 or else setup.cfg will sometimes not be loaded correctly
    " for example, flake8 documentation errors in tests/*
let b:ale_python_flake8_change_directory=0
let b:ale_python_flake8_executable='flake8'

let b:ale_python_mypy_ignore_invalid_syntax = 1

let g:black_linelength = 79

setlocal formatprg=black\ -\ --quiet\ 2>>\ /tmp/black.err
setlocal formatexpr=

IndentGuidesEnable
