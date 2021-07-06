let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls'],
  \ 'c': ['ccls'],
  \ 'cpp': ['ccls']
  \ }

let g:deoplete#enable_at_startup = 1
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
autocmd CompleteDone * silent! pclose!

