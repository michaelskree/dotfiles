" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Installed plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
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

" syntastic
set statusline+=%warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_javascript_checkers = ['jshint']
let g:sytastic_php_checkers = ['php', 'phpmd', 'phpcs']

" fugative
" git grep the current word under the cursor
nnoremap <Leader>g viwy:Ggrep <C-r>"<CR>
" automatically open quickfix window after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
