setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal foldmethod=indent
setlocal foldlevel=999

nnoremap <buffer> <F5> :%!yamlfix - <CR>
setlocal formatprg=yamlfix\ -
