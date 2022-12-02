syntax on
set t_Co=256
set go+=a
set number
set cindent
set mouse=a
set nowrap
set cursorline
set hlsearch
set history=100
set smartcase
set encoding=utf-8
set path+=**
set backspace=indent,eol,start
set noswapfile
set autoread
set hidden
set incsearch
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
nmap <silent> <leader><ESC> :let @/=""<CR>

