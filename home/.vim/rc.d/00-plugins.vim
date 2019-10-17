call plug#begin('~/.vim/plug')

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'git://github.com/davidhalter/jedi-vim.git'
  " colorscheme forest night
Plug 'git@github.com:sainnhe/vim-color-forest-night.git'
  " markdown folding
Plug 'git@github.com:masukomi/vim-markdown-folding.git'
  " python code formatter
Plug 'ambv/black'
  " Amazon Ion
Plug 'vmchale/ion-vim'
  " Render ANSI color codes in the buffer
Plug 'git@github.com:vim-scripts/AnsiEsc.vim.git'
  " Portable Game Notation syntax
Plug 'git://github.com/rpdelaney/vim-pgn.git'
Plug 'git://github.com/direnv/direnv.vim.git'
Plug 'git://github.com/hashivim/vim-terraform.git'
" https://github.com/juliosueiras/vim-terraform-completion " <-- check this out later
Plug 'git@github.com:rickhowe/diffchar.vim.git'
Plug 'git://github.com/rpdelaney/bats.vim.git'
Plug 'git://github.com/pbondoer/vim-42header.git'
  " TOML syntax highlighting
Plug 'git://github.com/cespare/vim-toml'
Plug 'git://github.com/PotatoesMaster/i3-vim-syntax.git'
Plug 'git://github.com/vim-scripts/python.vim--Vasiliev'
Plug 'git://github.com/alessandroyorba/despacio'
Plug 'git://github.com/romainl/vim-cool.git'
Plug 'git://github.com/ervandew/supertab.git'
" Plug 'git://github.com/vim-scripts/netrw.vim.git'
Plug 'git://github.com/vim-scripts/vim-indent-object.git'
Plug 'git://github.com/wincent/terminus.git'
Plug 'git://github.com/vim-scripts/groovy.vim.git'
" Plug 'git://github.com/greyblake/vim-preview.git'
Plug 'git://github.com/JarrodCTaylor/vim-shell-executor'
" Plug 'git://github.com/withgod/vim-sourcepawn.git'
Plug 'git://github.com/SirVer/ultisnips.git'
Plug 'git://github.com/airblade/vim-gitgutter.git'
" Plug 'git://github.com/altercation/solarized.git'
Plug 'git://github.com/bling/vim-airline.git'
Plug 'git://github.com/chilicuil/vim-sprunge.git'
Plug 'git://github.com/chrisbra/Recover.vim.git'
Plug 'git://github.com/fholgado/minibufexpl.vim.git'
" Plug 'git://github.com/godlygeek/tabular.git'
Plug 'git://github.com/jamessan/vim-gnupg.git'
Plug 'git://github.com/jmcantrell/vim-diffchanges.git'
Plug 'git://github.com/junegunn/vim-easy-align.git'
" Plug 'git://github.com/kongo2002/fsharp-vim.git'
Plug 'git://github.com/molok/vim-smartusline.git'
Plug 'git://github.com/ntpeters/vim-airline-colornum.git'
Plug 'git://github.com/rpdelaney/rtorrent-syntax-file.git'
Plug 'git://github.com/rpdelaney/vim-pgsql.git'
Plug 'git://github.com/rpdelaney/vim-psqlrc.git'
" Plug 'git://github.com/rpdelaney/vim-sourcecfg.git'
Plug 'git://github.com/w0rp/ale.git'
    "" Norminette
    "" See https://github.com/junegunn/vim-plug/wiki/tips under 'gist as plugin'
""Plug 'https://gist.github.com/SuperSpyTX/887922786834aa8e1914cfb0ee0d4177.git',
""    \ { 'as': 'norminette', 'do': 'mkdir -p plugin; cp -f *.vim plugin/' }
Plug 'git://github.com/tpope/vim-abolish.git'
Plug 'git://github.com/tpope/vim-characterize'
Plug 'git://github.com/tpope/vim-fugitive.git'
Plug 'git://github.com/tpope/vim-obsession.git'
" Plug 'git://github.com/tpope/vim-pathogen.git'
Plug 'git://github.com/tpope/vim-repeat.git'
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'git://github.com/wellle/targets.vim'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
