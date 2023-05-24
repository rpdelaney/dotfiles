setlocal wrap spell autoindent tabstop=4 softtabstop=4

let b:ale_linters = {'markdown': ['mdspell', 'vale']}
let b:ale_fixers = {'markdown': ['FixMarkdown']}
let b:ale_fix_on_save = 1

set foldlevel=999
