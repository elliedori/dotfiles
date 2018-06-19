set nocompatible
filetype off

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rails'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'mileszs/ack.vim'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'pangloss/vim-javascript'

call plug#end()
" Aliases
" First arg is what you type, second is the outcome

map <C-n> <plug>:NERDTreeTabsToggle<CR>

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

" Open NerdTree by default when opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Set directory for ctags
set tags=./tags,tags;$HOME
set number                        " Show line numbers
set nowrap                        " Turn off text wrap
set whichwrap+=<,>,[,]            " Back/forward moves across lines
set ruler                         " Show the cursor position all the time
set wildmenu                      " Make tab completion for files/buffers act like bash
set showcmd                       " Display incomplete commands
set hidden                        " Keep undo history for background buffers
set autoread | au CursorHold * checktime | call feedkeys("lh") " Autoload files on change
set autowriteall
:au FocusLost * :wa
set term=cons25                   " Fix issue with arrow keys
set term=screen-256color
set encoding=utf-8
set tabstop=4                     " Attempt to fix weird vim spacing
set shiftwidth=4
set softtabstop=4
set expandtab                     " Insert spaces when hitting <tab>
set autoindent                    " Keep indentation level of previous line
set smartindent                   " Indentation based on syntax
let g:auto_save_silent = 1
set noshowmode
set splitright                    " Open new NerdTree windows to the right
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb= " Turn off error beeps
filetype indent on                " Load the indentation for the current file type
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir'] " Allow for fuzzy search within files as well
let NERDTreeShowHidden=1          " Display hidden files in NerdTree
let g:ag_prg="ag --vimgrep --smart-case"
let g:ag_working_path_mode="r"    " Search from project root
set clipboard=unnamedplus         " Copy to global clipboard

set tabstop=2
set softtabstop=2
set shiftwidth=2
let g:auto_save_silent = 1

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Editing configuration
