" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Installed plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'benekastah/neomake'
Plugin 'joonty/vdebug'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-jdaddy'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'

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

" display correct colors on mac
if has('mac')
    let g:solarized_termtrans=1
endif

colorscheme solarized

" other simple options
set number
set ruler
set laststatus=2
set smartindent
set backspace=2
set scrolloff=5
set wildmenu
set wildignore=*.swp,*.o
set splitbelow
set colorcolumn=80
set relativenumber

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
hi Search ctermbg=110 ctermfg=28

" quickly exit insert mode
inoremap jk <esc>

" quick pane switching
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" commit messages
autocmd FileType gitcommit set spell textwidth=70 colorcolumn=70

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

" fugitive
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader>b :Gblame<CR>
" git grep the current word under the cursor
nnoremap <Leader>g :Ggrep <cword><CR>
" automatically open quickfix window after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" vdebug
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
if !exists('g:vdebug_features')
    let g:vdebug_features = {}
endif
let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['continuous_mode'] = 1
let g:vdebug_features['max_children'] = 128

" Add any cscope database in the current directory
if filereadable("cscope.out")
    cs add cscope.out
endif

" local config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
