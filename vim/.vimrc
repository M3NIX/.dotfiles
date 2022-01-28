" tab settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" visuals
set relativenumber             " Show relative line numbers
set number                     " Show current line number
set cursorline                 " Highlight cursor line
set cursorcolumn               " Highlight cursor column
set nowrap                     " Disable line wrapping
set scrolloff=8                " Start scrolling before reaching bottom
set colorcolumn=100             " Show line after 80 characters
set signcolumn=yes

" search settings
set smartcase                  " Enable smart case for searching
set nohlsearch                 " Only highlight current search result
set incsearch                  " Activate incremental search

" swap and undo settings
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Misc
set noerrorbells               " Disable sounds
set termguicolors

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Automatically remove trailing whitespaces on file write
autocmd BufWritePre * :%s/\s\+$//e

" Install plugin manager when not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize plugin system
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'

call plug#end()

" Load colorscheme
source ~/.vim/colorscheme.vim
