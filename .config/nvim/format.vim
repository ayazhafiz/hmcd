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

let g:clang_format#auto_format = 1
