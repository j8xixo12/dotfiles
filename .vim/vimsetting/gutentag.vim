let g:gutentags_project_root = ['.root', '.git']

let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = ['gtags_cscope']

let g:gutentags_plus_switch = 1

let s:vim_tags = expand('~/.cache/tags')

let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
