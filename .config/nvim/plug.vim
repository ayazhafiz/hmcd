" Handles Neovim Plug dependencies.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_SHARE_PATH", string(g:file))
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))

call plug#begin($NVIM_SHARE_PATH.'/plugged')

source $NVIM_CONFIG_PATH/ycm.vim

" Remote Neovim
Plug 'mhinz/neovim-remote', { 'do': 'pip3 install -e .' }

" Editing convinience
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Formatting
Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-clang-format'

" PLs
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ziglang/zig.vim'
Plug 'IngoHeimbach/neco-vim'
Plug 'neovimhaskell/haskell-vim'

" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Git
Plug 'tpope/vim-fugitive'

" Latex
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" fzf Install
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

source $NVIM_CONFIG_PATH/fzf.vim

call plug#end()
