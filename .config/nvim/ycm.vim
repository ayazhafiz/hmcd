" Handles YCM Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

let g:ycm_language_server = [
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ 'solargraph', 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \   {
  \     'name': 'fortran',
  \     'cmdline': [ 'fortls', '--symbol_skip_mem', '--incrmental_sync', '--autocomplete_no_prefix' ],
  \     'filetypes': [ 'fortran' ],
  \   },
  \ ]

let g:ycm_semantic_triggers = {
    \ 'c': [ 're!\w{1}' ],
    \ 'cpp,cuda,objcpp': [ 're!\w{1}' ],
    \ 'python': [ 're!\w{1}' ],
    \ 'ruby,rust': ['.', '::'],
    \ 'vim': [ 're!\w{1}' ],
    \ }

let g:ycm_rust_src_path = "$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

let g:ycm_python_interpreter_path = 'python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

"" Faster GoToDefinition
nnoremap <Leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>F :tab split \| YcmCompleter GoToDefinition<CR>
" Use K to show documentation in preview window
nnoremap <silent> K :YcmCompleter GetDoc<CR>

" Pmenu coloring
hi Pmenu ctermbg=242
