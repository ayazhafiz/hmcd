" Handles Neovim visual selection configurations.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" Replace all occurences of visual selection.
"" Safe version: one at a time
vnoremap <nowait> <Leader>r "hy:%s/<C-r>h//gc<Left><Left><Left>
"" Unsafe version: all at once
vnoremap <nowait> <Leader>R "hy:%s/<C-r>h//g<Left><Left>
