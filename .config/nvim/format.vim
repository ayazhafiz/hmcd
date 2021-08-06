" Handles Neovim formatting.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-clang-format'

augroup FormatJSLike
  " au BufWritePre *.js Neoformat prettier
augroup END
augroup FormatRubyLike
  au BufWritePre *.ex,*.rb,*.cr Neoformat
augroup END
augroup FormatPythonLike
  " au BufWritePre *.py Neoformat yapf
augroup END
augroup FormatML
  au BufWritePre *.json,*.graphql,*.html Neoformat
augroup END
augroup FormatStyles
  au BufWritePre *.css,*.scss Neoformat prettier
augroup END
augroup FormatRust
  au BufWritePre *.rs Neoformat
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

let g:clang_format#auto_format = 1
