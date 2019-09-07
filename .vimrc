set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Tab to Spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

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

" Auto-wrap at 100 columns
set textwidth=100
set formatoptions+=t

" Nice status bar with word count, file information
" Taken from:
" https://cromwell-intl.com/open-source/vim-word-count.html
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=lightgray ctermfg=16 cterm=bold
set statusline=%1*			" Switch to User1 color highlight
set statusline+=\%y			" file type
set statusline+=\ %<%F			" file name, cut if needed at start
set statusline+=\ %M			" modified flag
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ :%c,	                " line column
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

" Error columns beyond 100
let w:m1=matchadd('Search', '\%<101v.\%>101v', -1)
let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
au BufWinEnter * let w:m1=matchadd('Search', '\%<101v.\%>101v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Highlight extra whitespace
autocmd BufWinEnter <buffer> match Error /\s\+$/
autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
autocmd InsertLeave <buffer> match Error /\s\+$/
autocmd BufWinLeave <buffer> call clearmatches()

" Remap escape
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

" Map leader
let mapleader = ","

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
            \ 'python': [ 're!\w{1}' ],
            \ }
let g:ycm_rust_src_path = "$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

let g:ycm_python_interpreter_path = 'python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

"" Faster GoToDefinition
nnoremap <leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <leader>F :tab split \| YcmCompleter GoToDefinition<CR>

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
            \ 'passive_filetypes': ['python', 'c', 'cpp'],
            \ }

" Neoformat
autocmd BufWritePre *.js,*.ex,*.rb,*.cr,*.py Neoformat
autocmd BufWritePre *.json,*.graphql,*.yaml,*.html Neoformat
autocmd BufWritePre *.css,*.scss Neoformat prettier
autocmd BufWritePre *.rs Neoformat

" Clang format
let g:clang_format#auto_format = 1

" Latex Live Preview
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_progname = 'nvr'

" FZF
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

" Custom macros
"" Open new terminal at first tab
nnoremap <leader>t :tabnew<Space>+term<Space>\|<Space>tabm<Space>0<Cr>
"" Open fzf
nnoremap <leader>z :Files<Cr>
"" Open new tab with fzf
nnoremap <leader>Z :tabnew\|:Files<Cr>

""" Vim-latex
augroup VimLatexIMAPs
  au!
  "" Create problem environment
  au VimEnter * call IMAP('EPR', "\\begin{problem}{<++>}\<CR><++>\<CR>\\end{problem}<++>", 'tex')
  "" Create sub-problem environment
  au VimEnter * call IMAP('-EPR', "\\begin{problem}[]{<++>}\<CR><++>\<CR>\\end{problem}<++>", 'tex')
  "" Create solution environment
  au VimEnter * call IMAP('ESOL', "\\begin{solution}\<CR><++>\<CR>\\end{solution}<++>", 'tex')
  "" Create align environment(s)
  au VimEnter * call IMAP('EAL', "\\begin{align}\<CR><++>\<CR>\\end{align}<++>", 'tex')
  au VimEnter * call IMAP('*EAL', "\\begin{align*}\<CR><++>\<CR>\\end{align*}<++>", 'tex')
  "" Create subsection(s)
  au VimEnter * call IMAP('SEC', "\\section{<++>}\<CR><++>", 'tex')
  au VimEnter * call IMAP('*SEC', "\\section*{<++>}\<CR><++>", 'tex')
  au VimEnter * call IMAP('SSEC', "\\subsection{<++>}\<CR><++>", 'tex')
  au VimEnter * call IMAP('SSSEC', "\\subsubsection{<++>}\<CR><++>", 'tex')
  "" Create text font
  au VimEnter * call IMAP('FTX', '\text{<++>}<++>', 'tex')
  "" Create summation
  au VimEnter * call IMAP('SUM', '\sum_{<++>}^{<++>}<++>', 'tex')
  "" Create boxed expression
  au VimEnter * call IMAP('BOX', '\boxed{<++>}<++>', 'tex')
augroup end
"" Create a matrix with :Matrix <rows> <cols>
function! CreateMatrix(rows, ...) abort
  let cols = a:0 ? a:1 : a:rows
  let matrix = ['\begin{bmatrix}']
  call extend(matrix, repeat([repeat('<++> & ', cols - 1) . '<++>\\'], a:rows))
  call add(matrix, '\end{bmatrix}<++>')
  call append(line('.') - 1, matrix)
endfunction
command! -nargs=+ Matrix silent call CreateMatrix(<f-args>)

" Project-specific .vimrc
set exrc
set secure
