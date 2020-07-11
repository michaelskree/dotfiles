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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

" leader
let mapleader=','

" configure indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" color stuff
function! MyHighlights() abort
    highlight NeomakeErrorSign ctermfg=5 ctermbg=0
    highlight! link SignColumn LineNr
    if &background == 'dark'
        highlight IndentGuidesOdd  ctermbg=0
        highlight IndentGuidesEven ctermbg=236
    else
        highlight IndentGuidesOdd  ctermbg=LightGray
        highlight IndentGuidesEven ctermbg=LightGray
    endif
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

syntax enable
set background=dark
colorscheme solarized

" other simple options
set number
set ruler
set laststatus=2
set backspace=2
set scrolloff=5
set wildmenu
set wildmode=longest:full,full
set wildignore=*.swp,*.o
set splitbelow
set splitright
set colorcolumn=80
set relativenumber
set lazyredraw
set mouse=
set signcolumn=yes

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" spelling
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" quickly exit insert mode
inoremap jk <esc>

" quick pane switching
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

augroup MyFileTypes
    autocmd!
    autocmd FileType gitcommit setlocal spell textwidth=70 colorcolumn=70 signcolumn=no
    autocmd FileType qf setlocal colorcolumn= signcolumn=no
    autocmd FileType yaml setlocal softtabstop=2 shiftwidth=2
augroup END

" paste toggle
set pastetoggle=<Leader>p

" unhighlight things
nnoremap <Leader>h :nohl<CR>

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1

" neomake
nnoremap <Leader>m :Neomake<CR>

augroup NeomakeCommands
    autocmd!
    autocmd BufWritePost * Neomake
augroup END

" fugitive
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader>b :Gblame<CR>
" git grep the current word under the cursor
nnoremap <Leader>g :Ggrep <cword><CR>

augroup FugitiveCommands
    autocmd!
    " automatically open quickfix window after :Ggrep
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

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

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ctrlp
let g:ctrlp_regexp = 1

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_case_insensitive=1

" Add any cscope database in the current directory
if filereadable("cscope.out")
    cs add cscope.out
endif

" local config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
