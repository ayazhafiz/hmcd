" Line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Tab to Spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Auto-close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Remap escape
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {
 \ 'c': [ 're!\w{1}' ],
 \ 'cpp,cuda,objcpp': [ 're!\w{1}' ],
 \}
let g:ycm_rust_src_path = "$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

" Syntastic
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = "-std=c++17 -Wall -Wextra -Wpedantic"
let g:syntastic_cpp_include_dirs = ['../include', '../lib']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['c', 'cpp'] }

" Rust format on save
let g:rustfmt_autosave = 1

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

" Latex Live Preview
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_progname = 'nvr'
