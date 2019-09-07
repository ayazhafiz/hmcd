set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'vim-syntastic/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Formatting
Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-clang-format'

" PLs
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ziglang/zig.vim'

" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Git
Plug 'tpope/vim-fugitive'

" Latex
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

source ~/.vimrc
