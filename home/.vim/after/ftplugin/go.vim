autocmd BufWritePre <buffer> Fmt
setl foldmethod=syntax noexpandtab tabstop=4 shiftwidth=4 foldlevel=999
let b:ale_linters = {'go': ['golint', 'golangci-lint'] }
