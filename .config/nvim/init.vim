" Handles master Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))
call validate#CheckEnv("HOME", string(g:file))

let &runtimepath .= ','.expand($NVIM_CONFIG_PATH."/autoload")
let &packpath = &runtimepath

source $NVIM_CONFIG_PATH/mappings.vim
source $NVIM_CONFIG_PATH/window.vim
source $NVIM_CONFIG_PATH/frame.vim
source $NVIM_CONFIG_PATH/visual.vim

" Source all custom configurations
source $NVIM_CONFIG_PATH/plug.vim

" Prevent 'INSERT (paste)' mode
set nopaste

" Allow terminal modification
set modifiable

" Project-specific .vimrc
set exrc
set secure
