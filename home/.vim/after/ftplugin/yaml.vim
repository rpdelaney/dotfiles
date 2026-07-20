setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal foldmethod=indent
setlocal foldlevel=999

let b:ale_linters = {'yaml': ['yamllint', 'zizmor']}
let b:ale_fixers = {'yaml': ['yamlfix']}
let b:ale_fix_on_save = 0
