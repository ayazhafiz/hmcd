" Handles Neovim formatting.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-clang-format'

let g:neoformat_try_node_exe = 1

augroup FormatJSLike
  au BufWritePre *.ts,*.tsx Neoformat
augroup END
augroup FormatRubyLike
  " au BufWritePre *.ex,*.rb,*.cr Neoformat
augroup END
augroup FormatPythonLike
  "au BufWritePre *.py Neoformat yapf
augroup END
augroup FormatML
  au BufWritePre *.json,*.graphql,*.html Neoformat
augroup END
augroup FormatStyles
  au BufWritePre *.css,*.scss Neoformat prettierd
augroup END
augroup FormatHaskell
  au BufWritePre *.hs Neoformat brittany
augroup END
augroup FormatGo
  au BufWritePre *.go Neoformat
augroup END
augroup FormatML
  au BufWritePre *.ml,*.mli Neoformat
augroup END

autocmd filetype lisp,scheme setlocal equalprg=/Users/hafiz/.nvm/versions/node/v12.14.1/bin/scmindent

" let g:clang_format#auto_format = 1

" Removed in favor of rust-lang/rust.vim
" augroup FormatRust
"   au BufWritePre *.rs Neoformat
" augroup END
"
" For rust-lang/rust.vim
let g:rustfmt_autosave = 1
