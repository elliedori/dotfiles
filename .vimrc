" Plugins

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Aliases
" First arg is what you type, second is the outcome

map <C-n> <plug>:NERDTree<CR>

" ARROW KEYS ARE UNACCEPTABLE
map <Left> :echo "No! Use H"<cr>
map <Right> :echo "No! Use L"<cr>
map <Up> :echo "No! Use K"<cr>
map <Down> :echo "No! Use J"<cr>

" Pretty obvious defaults if you ask me...
  command! W :w
  command! Q :q
  command! Wq :wq
  command! WQ :wq

set number        " Show line numbers
set nowrap        " Turn off text wrap
set ruler         " Show the cursor position all the time
set wildmenu      " Make tab completion for files/buffers act like bash
set showcmd       " Display incomplete commands
set hidden        " Keep undo history for background buffers
set autoread      " Autoamically read the file again when it is changed externally
set showtabline=2 " Always show tab bar
set term=cons25   " Fix issue with arrow keys
set term=screen-256color
set ts=2          " Tabs equals 2 spaces
set encoding=utf-8
set noshowmode

" Editing configuration