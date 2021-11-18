  " Ale
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str="W"
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_priority = 30

let g:gitgutter_sign_priority = 9  " required to tell gitgutter to stop over-writing ale signs

  " smartusline
let g:smartusline_string_to_highlight = '(%n) %f '
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'

  " easy-align
    " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

  " terminus
let g:TerminusCursorShape = 1        " Controls whether the cursor changes shape when changing modes
let g:TerminusInsertCursorShape = 1  " Controls the shape of the cursor in insert mode: 0 block 1 bar 2 underline
let g:TerminusNormalCursorShape = 0  " Controls the shape of the cursor in normal mode
let g:TerminusReplaceCursorShape = 2 " Controls the shape of the cursor in replace mode
let g:TerminusMouse = 0              " Controls whether terminus attempts to improve mouse function by setting 'mouse' and 'typemouse' settings.
let g:TerminusFocusReporting = 1     " Controls whether terminus attempts to enable focus reporting

  " nerdtree {{{2
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✳",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "⬦",
    \ "Clean"     : " ",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" run nerdtree if we ran vim without a filepath argument
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only remaining window is a nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <silent> <F2> :NERDTreeToggle<CR>

    " vimdevicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:airline_powerline_fonts = 1

" vim600: set foldmethod=marker foldlevel=2 expandtab tabstop=2:
