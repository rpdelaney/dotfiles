let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=0

set tabstop=2

nnoremap <buffer> <F5> :execute 'TerraformFmt' <CR>
