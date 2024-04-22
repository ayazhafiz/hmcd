" HandlesmonitorRetryRequests master Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on

set mouse=

let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))
call validate#CheckEnv("HOME", string(g:file))

let &runtimepath .= ','.expand($NVIM_CONFIG_PATH."/autoload")
let &packpath = &runtimepath

source $NVIM_CONFIG_PATH/mappings.vim
source $NVIM_CONFIG_PATH/window.vim
source $NVIM_CONFIG_PATH/frame.vim
source $NVIM_CONFIG_PATH/visual.vim
source $NVIM_CONFIG_PATH/debug.vim

" Source all custom configurations
source $NVIM_CONFIG_PATH/plug.vim

" Prevent 'INSERT (paste)' mode
set nopaste

" Allow terminal modification
set modifiable

" Project-specific .vimrc
set exrc
set secure

lua require("init")
