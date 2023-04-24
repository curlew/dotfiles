" install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

color onehalfdark

set sw=4 ts=8 et

set number relativenumber
set cursorline cursorcolumn colorcolumn=100
set noshowmode
" case-insensitive search unless query contains uppercase (smartcase).
" global by default
set ignorecase smartcase gdefault
" keep 3+ lines above/below the cursor
set scrolloff=3
" don't move cursor column when moving with page commands
set nostartofline
" only insert one space after punctuation when joining lines
set nojoinspaces
" default position of new windows after splitting
set splitright splitbelow
"set autochdir exrc secure

nnoremap <space> <nop>
let g:mapleader = "\<space>"
noremap ; :
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <silent> <leader>l :NERDTreeToggle<CR>
noremap <silent> <leader>L :NERDTreeFind<CR>

" highlight:
" - hard tabs
" - trailing whitespace
" - lines continuing off-screen
" - non-breakable space characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t/

" ----  plugin settings  -------------------------------------------------------

let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
