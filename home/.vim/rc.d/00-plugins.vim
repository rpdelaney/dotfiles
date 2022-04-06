call plug#begin('~/.vim/plug')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

                                             " /* experimental and new. are these actually useful? /*
Plug 'ap/vim-you-keep-using-that-word'       " this would go under language extensions
Plug 'juliosueiras/vim-terraform-completion' " Terraform completion and linting

                                             " /* session management /*
Plug 'chrisbra/Recover.vim'                  " - diff mode for swap files
Plug 'fholgado/minibufexpl.vim'

                                             " /* vi language extensions */
Plug 'tpope/vim-characterize'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-indent-object'         " - adds a motion to an indentation level
Plug 'wellle/targets.vim'

                                             " /* appearance */
Plug 'bling/vim-airline'                     " - the most baller status line
Plug 'molok/vim-smartusline'                 " - change statusline color with vim mode
Plug 'rickhowe/diffchar.vim'                 " - smarter diff mode
Plug 'romainl/vim-cool'                      " - disable search highlighting when finished
Plug 'ryanoasis/vim-devicons'                " - add filetype glyphs in NERDtree
Plug 'vim-scripts/AnsiEsc.vim'               " - render and conceal ANSI escape sequences
Plug 'wincent/terminus'                      " - change cursor shape with vim mode while in tmux

                                             " /* dev tools */
Plug 'airblade/vim-gitgutter'                " - git status in the gutter
Plug 'dense-analysis/ale'                    " - awesome asynchronous linting integration in the gutter
Plug 'editorconfig/editorconfig-vim'         " - editorconfig support
Plug 'tpope/vim-fugitive'                    " - git inside vim
Plug 'whiteinge/diffconflicts'               " - merge conflict resolution for humans
Plug 'SirVer/ultisnips'                      " - ultimate snippets with extra sauce

                                             " /* colorschemes */
Plug 'morhetz/gruvbox'

                                             " /* syntax & file format handlers  */
Plug 'cespare/vim-toml'                      " - toml ftdetect and highlighting
Plug 'davidhalter/jedi-vim'                  " - python pseudo-ide
Plug 'hashivim/vim-terraform'                " - terraform ftdetect and highlighting
Plug 'jamessan/vim-gnupg'                    " - seamlessly edit gpg encrypted files
Plug 'plasticboy/vim-markdown'               " - markdown jiu jitsu
Plug 'potatoesmaster/i3-vim-syntax'          " - i3wm config files
Plug 'rpdelaney/rtorrent-syntax-file'        " - rtorrent config files
Plug 'rpdelaney/vim-pgn'                     " - portable game notation files (chess)
Plug 'rpdelaney/vim-pgsql'                   " - postgres SQL
Plug 'rpdelaney/vim-sourcecfg'               " - source engine configuration files
Plug 'vmchale/ion-vim'                       " - amazon ION
Plug 'withgod/vim-sourcepawn'                " - sourcepawn code
Plug 'fladson/vim-kitty'                     " - Kitty terminal config files
Plug 'meatballs/vim-xonsh'                   " - xonsh

call plug#end()
