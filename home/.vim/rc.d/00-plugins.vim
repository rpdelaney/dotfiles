call plug#begin('~/.vim/plug')

  " merge conflict resolution for humans
Plug 'whiteinge/diffconflicts'
  " python integrations
Plug 'davidhalter/jedi-vim'

Plug 'git@github.com:scrooloose/nerdtree.git'
  " See https://github.com/Xuyuanp/nerdtree-git-plugin/issues/127
" Plug 'git@github.com:Xuyuanp/nerdtree-git-plugin.git'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'git@github.com:ryanoasis/vim-devicons.git'

Plug 'git@github.com:editorconfig/editorconfig-vim.git'
  " markdown folding
Plug 'git@github.com:masukomi/vim-markdown-folding.git'
  " python code formatter
  " https://github.com/psf/black/issues/1293
Plug 'psf/black', { 'tag': '19.10b0' }
  " Amazon Ion
Plug 'vmchale/ion-vim'
  " Render ANSI color codes in the buffer
  " TODO: this provides a command 'AnsiEsc' but currently I lack a memorable
  " way to run it when needed
Plug 'git@github.com:vim-scripts/AnsiEsc.vim.git'
  " Portable Game Notation syntax
Plug 'git://github.com/rpdelaney/vim-pgn.git'
Plug 'git://github.com/direnv/direnv.vim.git'
Plug 'git://github.com/hashivim/vim-terraform.git'
" https://github.com/juliosueiras/vim-terraform-completion " <-- check this out later
Plug 'git@github.com:rickhowe/diffchar.vim.git'
Plug 'git@github.com:vim-scripts/bats.vim.git'
  " TOML syntax highlighting
Plug 'git://github.com/cespare/vim-toml'
Plug 'git://github.com/PotatoesMaster/i3-vim-syntax.git'
Plug 'git://github.com/vim-scripts/python.vim--Vasiliev'
Plug 'git://github.com/romainl/vim-cool.git'
Plug 'git://github.com/ervandew/supertab.git'
Plug 'git://github.com/vim-scripts/vim-indent-object.git'
Plug 'git://github.com/wincent/terminus.git'
Plug 'git://github.com/JarrodCTaylor/vim-shell-executor'
Plug 'git://github.com/withgod/vim-sourcepawn.git'
Plug 'git://github.com/SirVer/ultisnips.git'
Plug 'git://github.com/airblade/vim-gitgutter.git'
Plug 'git://github.com/bling/vim-airline.git'
Plug 'git://github.com/chilicuil/vim-sprunge.git'
Plug 'git://github.com/chrisbra/Recover.vim.git'
Plug 'git://github.com/fholgado/minibufexpl.vim.git'
" Plug 'git://github.com/godlygeek/tabular.git'
Plug 'git://github.com/jamessan/vim-gnupg.git'
Plug 'git://github.com/jmcantrell/vim-diffchanges.git'
Plug 'git://github.com/junegunn/vim-easy-align.git'
Plug 'git://github.com/molok/vim-smartusline.git'
Plug 'git://github.com/ntpeters/vim-airline-colornum.git'
Plug 'git://github.com/rpdelaney/rtorrent-syntax-file.git'
Plug 'git://github.com/rpdelaney/vim-pgsql.git'
Plug 'git://github.com/rpdelaney/vim-psqlrc.git'
Plug 'git://github.com/rpdelaney/vim-sourcecfg.git'
Plug 'git://github.com/w0rp/ale.git'
Plug 'git://github.com/morhetz/gruvbox.git'
Plug 'git://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'git@github.com:vim-jp/vim-go-extra.git'
Plug 'git://github.com/tpope/vim-abolish.git'
Plug 'git://github.com/tpope/vim-characterize'
Plug 'git://github.com/tpope/vim-fugitive.git'
Plug 'git://github.com/tpope/vim-obsession.git'
Plug 'git://github.com/tpope/vim-repeat.git'
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'git://github.com/wellle/targets.vim'

" Add plugins to &runtimepath
call plug#end()

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
