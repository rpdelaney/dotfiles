nnoremap <buffer> <F5> :%!python -m json.tool \| uncolor <CR>

setlocal formatprg=python\ -m\ json.tool \| uncolor
