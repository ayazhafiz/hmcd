" Handles Neovim frame configurations.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

" Relative numbers in normal mode
" Absolute numbers in insert mode
set number relativenumber
augroup numbertoggle
  au!
  au BufEnter,FocusGained,InsertLeave * set relativenumber
  au BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

