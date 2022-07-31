syntax on

" FZF settings
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
" let g:fzf_preview_window='right:40%'
" nnoremap <silent> <C-B> :Buffers<CR>
" nnoremap <silent> <C-P> :Files<CR>
" nnoremap <silent> <C-n> :NERDTreeToggle %<CR>

" FILE Explorer config
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_winsize = 20

"grep settings
set grepprg=ag\ --nogroup\ --nocolor

"Coc settings
" source ~/.config/nvim/coc.vim
lua << EOF
require('init')
EOF

