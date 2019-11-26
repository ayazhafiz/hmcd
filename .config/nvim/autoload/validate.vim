" Handles Neovim environment validation functions.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

function g:validate#PrintError(msg, file) abort
  execute 'normal! \<Esc>'
  echohl ErrorMsg
  echomsg "ERROR: ".a:file.": ".a:msg
  echohl None
endfunction

function g:validate#CheckEnv(variable, file)
  let ev = "$".a:variable
  if !exists(ev)
    call validate#PrintError("Environment variable ".ev." not defined.", g:file)
  endif
endfunction
