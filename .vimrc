" Line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Tab to Spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Split to bottom and right
set splitbelow
set splitright

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

""" Package Configurations

" YCM
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {
            \ 'c': [ 're!\w{1}' ],
            \ 'cpp,cuda,objcpp': [ 're!\w{1}' ],
            \ }
let g:ycm_rust_src_path = "$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

" LanguageClient
let g:LanguageClient_autoStart = 1
nnoremap <leader>lcs :LanguageClientStart<CR>
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ }
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Syntastic
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['c', 'cpp'],
            \ }

" Neoformat
autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.rs Neoformat
autocmd BufWritePre *.js,*.ts,*.ex,*.rb,*.cr,*.py Neoformat
autocmd BufWritePre *.json,*.graphql,*.yaml,*.html Neoformat
autocmd BufWritePre *.css,*.scss Neoformat prettier

" Latex Live Preview
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_progname = 'nvr'
