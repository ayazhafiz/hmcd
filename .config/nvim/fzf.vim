" Handles fzf Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" Ignore non-git files.
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git --ignore-file .gitignore'

" Open fzf
nnoremap <silent> <Leader>z :Files<Cr>
nnoremap <silent> <Leader>h :History:<Cr>
nnoremap <silent> <Leader>b :Buffers<Cr>

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tabnew',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
