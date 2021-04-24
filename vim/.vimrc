"Vim setting
runtime! vimsetting/*.vim
"-------------------------------------------------------------"
"Plugin management
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bling/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'djoshea/vim-autoread'
" Plug 'ervandew/supertab'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
"-------------------------------------------------------------"

call plug#end()
