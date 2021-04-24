syntax on
set t_Co=256
set go+=a
set number
set cindent
set mouse=a
set nowrap
set cursorline
set ts=2
set sw=2
set hlsearch
set history=100
set smartcase
set expandtab
set encoding=utf-8
set path+=**
autocmd FileType Makefile setlocal noexpandtab
autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab
set backspace=indent,eol,start
set noswapfile
set autoread
set hidden
autocmd BufWritePre * :%s/\s\+$//e
nmap <silent> <leader><ESC> :let @/=""<CR>
