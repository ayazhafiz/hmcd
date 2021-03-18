" Handles Programming Language dependencies.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" PLs
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ziglang/zig.vim'
Plug 'IngoHeimbach/neco-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'itspriddle/vim-shellcheck'
" Plug 'kovisoft/slimv'

" Shellcheck
au FileType sh nnoremap <buffer> <leader>c :ShellCheck!<CR>
