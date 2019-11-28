autocmd BufWritePre <buffer> Fmt
setlocal foldmethod=syntax noexpandtab tabstop=4 shiftwidth=4 foldlevel=999
let b:ale_linters = {'go': ['golint', 'golangci-lint'] }

  " call formatter function when we hit a key
nnoremap <buffer> <F5> :execute 'GoFmt' <CR>
