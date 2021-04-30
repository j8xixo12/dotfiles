let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls'],
  \ 'c': ['ccls-clang-11'],
  \ 'cpp': ['ccls-clang-11']
  \ }

let g:deoplete#enable_at_startup = 1
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
autocmd CompleteDone * silent! pclose!

