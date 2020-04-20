  " Ale {{{2
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str="W"
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_priority = 30
    " required to tell gitgutter to stop over-writing ale signs
let g:gitgutter_sign_priority = 9
" Ale 2}}}
  " supertab {{{2
  " binds to start the autocompletion
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
  " Attempt to guess what I am auto-completing by context
  " e.g. method calls or attribute references via '.', '::' or '->', and file paths with '/'
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-p>"
  " supertab 2}}}
  " UltiSnips {{{2
let g:UltiSnipsEditSplit          = "vertical"
let g:UltiSnipsListSnippet        = "<c-tab>"
let g:UltiSnipsExpandTrigger      = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger   = "<s-l>"
let g:UltiSnipsJumpBackwardTrigger  = "<s-h>"
  " UltiSnips 2}}}
  " smartusline {{{2
let g:smartusline_string_to_highlight = '(%n) %f '
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'
  " smartusline 2}}}
  " easy-align {{{2
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
  " easy-align 2}}}
  " terminus {{{2
" Controls whether the cursor changes shape when changing modes
let g:TerminusCursorShape = 1
" Controls the shape of the cursor in insert mode: 0 block 1 bar 2 underline
let g:TerminusInsertCursorShape = 1
" Controls the shape of the cursor in normal mode
let g:TerminusNormalCursorShape = 0
" Controls the shape of the cursor in replace mode
let g:TerminusReplaceCursorShape = 2
" Controls whether terminus attempts to improve mouse function by setting
" 'mouse' and 'typemouse' settings.
let g:TerminusMouse = 0
" Controls whether terminus attempts to enable focus reporting
let g:TerminusFocusReporting = 1
  " terminus 2}}}
  " latex {{{2
let g:tex_flavor = "latex"
  " latex 2}}}
  " nerdtree {{{2
let g:NERDTreeIndicatorMapCustom = {
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
    " nerdtree 2}}}
    " vimdevicons {{{2
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:airline_powerline_fonts = 1
map <silent> <F2> :NERDTreeToggle<CR>
    " vimdevicons 2}}}

" vim600: set foldmethod=marker foldlevel=2 expandtab tabstop=2:
