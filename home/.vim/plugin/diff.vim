" I like gruvbox, except it uses 'reverse'd colors in diff mode. I find that
" hard to read, so I set my own diff styles
"
" defaults for gruvbox:
" highlight DiffAdd        term=bold cterm=reverse ctermfg=142 ctermbg=0 gui=reverse guifg=#b8bb26guibg=#32302f
" highlight DiffChange     term=bold ctermbg=0 guibg=#32302f
" highlight DiffDelete     term=bold cterm=reverse ctermfg=167 ctermbg=0 gui=reverse guifg=#fb4934guibg=#32302f
" highlight DiffText       term=reverse ctermbg=0 guibg=#32302f
"
highlight DiffAdd        cterm=NONE term=underline gui=NONE   guifg=#70d8dd guibg=#1d2021
highlight DiffChange     cterm=NONE term=underline gui=NONE   guifg=#a89984 guibg=#1d2021  " GruvboxGray
highlight DiffDelete     cterm=NONE term=underline gui=NONE   guifg=#601406 guibg=#1d2021
highlight DiffText       cterm=NONE term=underline gui=NONE   guifg=#f2a0ef guibg=#1d2021

if &diff
  set wrap
  set scrollbind
  set cursorbind
endif
