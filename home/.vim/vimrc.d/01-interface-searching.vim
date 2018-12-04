  " enable enhanced command-line completion
set wildmenu
  " Exclude these files and directories from search
set wildignore+=*.git/*,*.hg/*,*.svn/*,*.so,*.pdf,*.py[co],*.o,*.swp,*.aux,*.toc
  " Suffixes that are ignored when doing filename autocompletion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
  " smart case
set smartcase
  " highlight all search matches
set hlsearch
  " always search the whole file regardless of cursor position
set wrapscan
  " show search results visually
set showmatch
  " search incrementally
set incsearch
  " When searching, scroll to the next search pattern automatically with 4+ lines visible above and below the cursor
set scrolloff=4

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
