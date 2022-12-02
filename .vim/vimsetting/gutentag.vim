let g:gutentags_project_root = ['.root', '.git']

let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = ['gtags_cscope']

let g:gutentags_plus_switch = 1
let gutentags_add_default_project_roots = 0

let s:vim_tags = expand('~/.cache/tags')

let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

noremap <silent> cs :GscopeFind s <C-R><C-W><cr>
noremap <silent> cg :GscopeFind g <C-R><C-W><cr>
noremap <silent> cc :GscopeFind c <C-R><C-W><cr>
noremap <silent> ct :GscopeFind t <C-R><C-W><cr>
noremap <silent> ce :GscopeFind e <C-R><C-W><cr>
noremap <silent> cf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> ci :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> cd :GscopeFind d <C-R><C-W><cr>
noremap <silent> ca :GscopeFind a <C-R><C-W><cr>
noremap <silent> cz :GscopeFind z <C-R><C-W><cr>
