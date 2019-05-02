set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')

" Fugitive (Git)
Plug 'tpope/vim-fugitive'

" YouCompleteMe (autocompletion, server)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Clang-Format
Plug 'rhysd/vim-clang-format'

" Rust
Plug 'rust-lang/rust.vim'

" Crystal
Plug 'rhysd/vim-crystal'

" Ruby
Plug 'vim-ruby/vim-ruby'

" TypeScript
Plug 'leafgarland/typescript-vim'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Rufo
Plug 'ruby-formatter/rufo-vim'

" Mix Format
Plug 'mhinz/vim-mix-format'

" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

" Surround
Plug 'tpope/vim-surround'

" Vimtex
Plug 'lervag/vimtex'

" Latex Live Preview
Plug 'xuhdev/vim-latex-live-preview'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Markdown Formatter
Plug 'moorereason/vim-markdownfmt'

" Conque Shell
Plug 'lrvick/Conque-Shell'

call plug#end()
