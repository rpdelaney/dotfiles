  " remove whitespace
function! <SID>StripTrailingWhitespaces()
  let b:view = winsaveview()

  %s/\s\+$//e

  call winrestview(b:view)
  unlet b:view
endfunction

set formatexpr=<SID>StripTrailingWhitespaces()

  " call formatter function when we hit a key
" nnoremap <buffer> <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
