" Plugins

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Aliases
" First arg is what you type, second is the outcome

map <C-n> :NERDTree
