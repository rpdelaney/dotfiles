setlocal wrap spell autoindent tabstop=4 softtabstop=4
let b:ale_linters = {'markdown': ['mdspell', 'vale']}
nnoremap <buffer> <F5> :%!mdformat - <CR>
setlocal formatprg=mdformat\ -
