set wildmenu  " enable enhanced command-line completion
set wildignore+=*.git/*,*.hg/*,*.svn/*,*.so,*.pdf,*.py[co],*.o,*.swp,*.aux,*.toc  " Exclude these files and directories from search
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc  " Suffixes that are ignored when doing filename autocompletion

set smartcase   " smart case
set hlsearch    " highlight all search matches
set wrapscan    " always search the whole file regardless of cursor position
set showmatch   " show search results visually
set incsearch   " search incrementally
set scrolloff=4 " When searching, scroll to the next search pattern automatically with 4+ lines visible above and below the cursor
