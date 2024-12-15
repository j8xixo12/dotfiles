"-------------------------------------------------------------"
"Plugin management
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
" Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bling/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'djoshea/vim-autoread'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ojroques/vim-oscyank'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
" Plug 'inkarkat/vim-mark'
Plug 'chentoast/marks.nvim'
" Plug 'yegappan/taglist'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
"-------------------------------------------------------------"
call plug#end()

"Vim setting
filetype on
runtime! vimsetting/*.vim
runtime! file_type/*.vim

