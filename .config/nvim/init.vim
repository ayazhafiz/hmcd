" Handles master Neovim configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))
call validate#CheckEnv("HOME", string(g:file))

let &runtimepath .= ','.expand($NVIM_CONFIG_PATH."/autoload")
let &packpath = &runtimepath

" Map leader
let g:mapleader = ","

source $NVIM_CONFIG_PATH/plug.vim
source $NVIM_CONFIG_PATH/frame.vim
source $NVIM_CONFIG_PATH/visual.vim

" Source all custom configurations
source $NVIM_CONFIG_PATH/plug.vim

" Tab to Spaces
set tabstop=8 softtabstop=2 expandtab shiftwidth=2 smarttab

" Split to bottom and right
set splitbelow
set splitright

" Remap escape
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

" Open vimconfig
nnoremap <leader>v :edit $MYVIMRC<CR>

" Prevent 'INSERT (paste)' mode
set nopaste

" Remove highlight
nnoremap <Leader>n :noh<CR>

" View directory of currently-edited file
nnoremap <Leader>ls :edit %:p:h<CR>

" Save current file as copy
nmap <Leader>sa :saveas %:p:h/

" Remap sourcing file
nnoremap <Leader>so :so %<CR>

" Remap normal mode command key
nnoremap ; :
nnoremap : ;

" Auto-close brackets
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Auto-wrap at 100 columns
set textwidth=100
set formatoptions+=t

" Execute command
"" Command specified in VimScript
nnoremap <Leader>x :tabnew<Space>\|<Space>pu=execute('<C-r>\')<Left><Left>
tnoremap <Leader>x :tabnew<Space>\|<Space>pu=execute('<C-r>\')<Left><Left>
"" Command specified by visual selection
vnoremap <Leader>X "xy:@x<CR>

" Nice status bar with word count, file information
" Taken from:
" https://cromwell-intl.com/open-source/vim-word-count.html
let g:word_count="<unknown>"
function! WordCount()
	return g:word_count
endfunction
function! UpdateWordCount()
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
set statusline+=%=			" separator from Left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ :%c,	                " line column
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

" Error columns beyond 100
let w:m1=matchadd('Search', '\%<101v.\%>101v', -1)
let w:m2=matchadd('WarningMsg', '\%>100v.\+', -1)
au BufWinEnter * let w:m1=matchadd('Search', '\%<101v.\%>101v', -1)
au BufWinEnter * let w:m2=matchadd('WarningMsg', '\%>100v.\+', -1)

" Highlight extra whitespace
au BufWinEnter <buffer> match Error /\s\+$/
au InsertEnter <buffer> match Error /\s\+\%#\@<!$/
au InsertLeave <buffer> match Error /\s\+$/
au BufWinLeave <buffer> call clearmatches()

" Neoformat
augroup FormatJSLike
  " au BufWritePre *.js Neoformat prettier
augroup END
augroup FormatRubyLike
  au BufWritePre *.ex,*.rb,*.cr Neoformat
augroup END
augroup FormatPythonLike
  au BufWritePre *.py Neoformat
augroup END
augroup FormatML
  au BufWritePre *.json,*.graphql,*.yaml,*.html Neoformat
augroup END
augroup FormatStyles
  au BufWritePre *.css,*.scss Neoformat prettier
augroup END
augroup FormatRust
  au BufWritePre *.rs Neoformat
augroup END

" Clang format
let g:clang_format#auto_format = 1

" Latex Live Preview
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_progname = 'nvr'

" Custom macros
"" Open new terminal at first tab
nnoremap <Leader>T :tabnew<Space>+term<Space>\|<Space>tabm<Space>0<Cr>
"" Allow terminal modification
set modifiable

" Editing
inoremap <silent> <Leader>w <Esc>:w<CR>
inoremap <silent> <Leader>q <Esc>:q<CR>
nnoremap <silent> <Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader>q <Esc>:q<CR>

" Tabs
nnoremap H gT
nnoremap L gt

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
