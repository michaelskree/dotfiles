" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Installed plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'benekastah/neomake'
Plugin 'joonty/vdebug'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" leader
let mapleader=','

" configure tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" color stuff
syntax enable
set background=dark
colorscheme solarized

" other simple options
set number
set ruler
set laststatus=2
set smartindent
set backspace=2
set scrolloff=5

" searching
set hlsearch
set incsearch
hi Search ctermbg=110 ctermfg=28

" quickly exit insert mode
inoremap jk <esc>

" quick pane switching
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" jump to tag
nnoremap <c-u> yiw:tag <c-r>"<cr>

" commit messages
autocmd FileType gitcommit set spell textwidth=70

" paste toggle
set pastetoggle=<Leader>p

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=236

" neomake
autocmd! BufWritePost,BufRead * Neomake
let g:neomake_warning_sign={'text': 'W', 'texthl': 'WarningMsg'}
let g:neomake_error_sign={'text': 'E', 'texthl': 'ErrorMsg'}
let g:neomake_php_phpcs_args_standard="phpcs.xml"

" fugative
" git grep the current word under the cursor
nnoremap <Leader>g :Ggrep <cword><CR>
" automatically open quickfix window after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
