  " listchars to highlight stuff we don't like
set list
  " Make sure NonText looks grey
set highlight+=8:NonText
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    " If we have utf-8 encoding, use fancy listchars
  set listchars=tab:→\ ,eol:\ ,trail:·,extends:≻,precedes:≺,conceal:�,nbsp:␣
    " Show this character on a wrapped line
  set showbreak=
else
    " Otherwise, use ANSI
  set listchars=tab:>\ ,eol:\ ,trail:~,extends:>,precedes:<,conceal:*,nbsp:_
  " Show this character on a wrapped line
  set showbreak=
endif
