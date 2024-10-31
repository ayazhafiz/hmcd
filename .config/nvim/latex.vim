" Handles Neovim LaTeX configuration.
" This file has no copyright.
"
" Author: @ayazhafiz
" Source: https://github.com/ayazhafiz/hmcd

Plug 'vim-latex/vim-latex'
"Plug 'xuhdev/vim-latex-live-preview'

let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_progname = 'nvr'

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
