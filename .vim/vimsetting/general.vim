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
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
set ff=unix fenc=utf8 et sw=4 ts=4 sts=4
set binary noeol
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
set conceallevel=0
" autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
nmap <silent> <leader><ESC> :let @/=""<CR>

"quick close quickfix window"
nmap <silent> <leader> b : ccl <CR>
let g:augment_workspace_folders = ['./']
map <leader> w :set wrap!<CR>
