setlocal wrapmargin=0 textwidth=0
setlocal foldmethod=indent foldlevel=999
setlocal expandtab shiftwidth=4 softtabstop=4
setlocal completeopt=menuone,preview

let b:python_highlight_all = 1
let b:python_slow_sync = 1

let b:ale_linters = {'python': ['ruff', 'flake8', 'mypy']}
let b:ale_fixers = {'python': ['ruff', 'ruff_format']}
let b:ale_fix_on_save = 0

let b:ale_python_mypy_ignore_invalid_syntax = 1

nnoremap <buffer> <F5> :ALEFix <CR>
