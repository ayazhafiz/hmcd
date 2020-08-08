" Handles Neovim Plug dependencies.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_SHARE_PATH", string(g:file))
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))

call plug#begin($NVIM_SHARE_PATH.'/plugged')

source $NVIM_CONFIG_PATH/editing.vim
source $NVIM_CONFIG_PATH/format.vim
source $NVIM_CONFIG_PATH/latex.vim

" source $NVIM_CONFIG_PATH/ycm.vim
source $NVIM_CONFIG_PATH/coc.vim
source $NVIM_CONFIG_PATH/fzf.vim

source $NVIM_CONFIG_PATH/pl.vim

" Remote Neovim
Plug 'mhinz/neovim-remote', { 'do': 'pip3 install -e .' }

" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Git
Plug 'tpope/vim-fugitive'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

let todoist = { 'key': $TODOIST_API_KEY }
Plug 'romgrk/todoist.vim', { 'do': ':TodoistInstall' }

call plug#end()
