" Handles window and tab Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" Split to bottom and right
set splitbelow
set splitright

" Tabs
nnoremap H gT
nnoremap L gt

" Windows
let g:C_Ctrl_j = 'off'
noremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Error columns beyond 100
" To override, set colorcolumn in a project-specific .nvimrc
set colorcolumn=80
highlight ColorColumn ctermbg=8

" Highlight extra whitespace
au BufWinEnter <buffer> match Error /\s\+$/
au InsertEnter <buffer> match Error /\s\+\%#\@<!$/
au InsertLeave <buffer> match Error /\s\+$/
au BufWinLeave <buffer> call clearmatches()

" Auto-wrap at 100 columns
" To override, set textwidth in a project-specific .nvimrc
set textwidth=80
set formatoptions+=t

" Diff highlights
" hi DiffText     ctermbg=242
hi DiffChange   ctermbg=53
hi DiffDelete   ctermbg=8
hi DiffAdd      ctermbg=22

au BufRead,BufNewFile *.nasm		set filetype=nasm
au BufRead,BufNewFile *.ll		  set filetype=llvm
au BufRead,BufNewFile *.roc		  set filetype=elm
