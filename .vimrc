set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'commentary.vim'
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-markdown'
Plugin 'mhinz/vim-signify'
call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


" my default vim stuffs
set nu
syn on
set cursorline
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set showtabline=2
set hlsearch

" read *.md as markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""" this is amateur hour here
" python column count buffer red line
" set colorcolumn=81 "set cc=80 "cc for short

""" This is a better way of doing this....if it actually works
" http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight OverLength ctermfg=white ctermbg=red guibg=#592929
    autocmd FileType python match OverLength /\%81v.\+/
    autocmd FileType python set nowrap
    augroup END


""""""""""""""""""""""""""""""""""""""
" Python-mode
""""""""""""""""""""""""""""""""""""""
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
