" Handles Neovim editing conviniences.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" Editing convinience
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Tab to Spaces
set tabstop=8 softtabstop=2 expandtab shiftwidth=2 smarttab

let g:projectionist_heuristics = {
    \ '*.ts': { 'alternate': '{dirname}/{basename}.test.ts' }
\ }

let g:dispatch_compilers = {
      \ '*.test.ts': 'pnpm jest',
\ }

autocmd User Rails compiler rspec
