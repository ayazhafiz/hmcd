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
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/conflict-marker.vim'

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'preservim/tagbar'

let todoist = { 'key': $TODOIST_API_KEY }
Plug 'romgrk/todoist.vim', { 'do': ':TodoistInstall' }

Plug 'dstein64/vim-startuptime'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'puremourning/vimspector'

Plug 'rust-lang/rust.vim'

Plug 'cshuaimin/ssr.nvim'

Plug 'ruanyl/vim-gh-line'

" Theme
Plug 'navarasu/onedark.nvim'

" Curse?
" Plug 'github/copilot.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'

call plug#end()
