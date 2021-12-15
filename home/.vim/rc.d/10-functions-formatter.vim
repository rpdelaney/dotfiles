" by romainl
" from here: https://gist.github.com/romainl/d2ad868afd7520519057475bd8e9db0c
"
" gq wrapper that:
" - tries its best at keeping the cursor in place
" - tries to handle formatter errors
"
function! Format(type, ...)
    normal! '[v']gq
    if v:shell_error > 0
        silent undo
        redraw
        echomsg 'formatprg "' . &formatprg . '" exited with status ' . v:shell_error
    endif
    call winrestview(w:gqview)
    unlet w:gqview
endfunction

nmap <silent> GQ :let w:gqview = winsaveview()<CR>:set opfunc=Format<CR>g@

    " run the formatter (formatprg or formatexpr) on the selected buffer and return cursor to its
    " original position
nnoremap <silent> <buffer> <F5> :let b:view = winsaveview()<CR>gggqG:call winrestview(b:view)<CR>:unlet b:view<CR>
