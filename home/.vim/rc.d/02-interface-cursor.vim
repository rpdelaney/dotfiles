"if &term =~ "xterm\\|rxvt|screen-256color"
" " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
" " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;white\x7"
" silent !echo -ne "\033]12;red\007"
" " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
" " use \003]12;gray\007 for gnome-terminal
"endif

"if &term =~ '^xterm|^screen'
  " start insert mode
  let &t_SI .= "\<Esc>[3 q"
  " exit insert mode
  let &t_EI .= "\<Esc>[0 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
"endif

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
