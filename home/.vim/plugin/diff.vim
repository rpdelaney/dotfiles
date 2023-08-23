" defaults for gruvbox:
" highlight DiffAdd        term=bold cterm=reverse ctermfg=142 ctermbg=0 gui=reverse guifg=#b8bb26guibg=#32302f
" highlight DiffChange     term=bold ctermbg=0 guibg=#32302f
" highlight DiffDelete     term=bold cterm=reverse ctermfg=167 ctermbg=0 gui=reverse guifg=#fb4934guibg=#32302f
" highlight DiffText       term=reverse ctermbg=0 guibg=#32302f
"
highlight DiffAdd        cterm=NONE term=underline gui=NONE   guifg=#689d6a guibg=#000000
highlight DiffChange     cterm=NONE term=underline gui=NONE   guifg=#d79921 guibg=#000000
highlight DiffDelete     cterm=NONE term=underline gui=NONE   guifg=#cc241d guibg=#000000
highlight DiffText       cterm=NONE term=underline gui=NONE   guifg=#b16286 guibg=#000000

if &diff
  set wrap
  set scrollbind
  set cursorbind
endif
