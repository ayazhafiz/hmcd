" Handles general Neovim mappings.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let g:mapleader = ","

" Remap escape
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

" Remove highlight
nnoremap <Leader>n :noh<CR>

" Open vimconfig
nnoremap <leader>v :edit $MYVIMRC<CR>

" View directory of currently-edited file
nnoremap <Leader>ls :edit %:p:h<CR>

" Save current file as copy
nmap <Leader>sa :saveas %:p:h/

" Remap sourcing file
nnoremap <Leader>so :so %<CR>

" Remap normal mode command key
nnoremap ; :
nnoremap : ;
inoremap <silent> <Leader>w <Esc>:w<CR>
inoremap <silent> <Leader>q <Esc>:q<CR>
nnoremap <silent> <Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader>q <Esc>:q<CR>

" Auto-close brackets
inoremap ' ""<++><Left><Left><Left><Left><Left>
inoremap ' ''<++><Left><Left><Left><Left><Left>
inoremap ( ()<++><Left><Left><Left><Left><Left>
inoremap [ []<++><Left><Left><Left><Left><Left>
inoremap { {}<++><Left><Left><Left><Left><Left>

" Execute command
"" Command specified in VimScript
nnoremap <Leader>x :tabnew<Space>\|<Space>pu=execute('<C-r>\')<Left><Left>
tnoremap <Leader>x :tabnew<Space>\|<Space>pu=execute('<C-r>\')<Left><Left>
"" Command specified by visual selection
vnoremap <Leader>X "xy:@x<CR>

" Open new terminal at first tab
nnoremap <Leader>T :tabnew<Space>+term<Space>\|<Space>tabm<Space>0<Cr>
