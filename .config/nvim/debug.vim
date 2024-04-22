" Handles master Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let g:vimspector_enable_mappings = 'HUMAN'

" Rust
nnoremap <Leader>rst :CocCommand rust-analyzer.run<CR>
