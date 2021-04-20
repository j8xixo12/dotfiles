syntax on
set t_Co=256
set go+=a
set number
set autoindent
set mouse=a
set nowrap
set cursorline
set tabstop=2
set shiftwidth=2
set hlsearch
set history=100
set smartcase
set expandtab
set encoding=utf-8
set path+=**
autocmd FileType Makefile setlocal noexpandtab
set backspace=indent,eol,start
set noswapfile
set autoread
set hidden
autocmd BufWritePre * :%s/\s\+$//e
nmap <silent> <leader><ESC> :let @/=""<CR>
