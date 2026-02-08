" plugins
call plug#begin()
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-unimpaired'
call plug#end()

" leader
let mapleader=','

" configure indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" color stuff
function! MyHighlights() abort
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

" fugitive
nnoremap <Leader>s :Git<CR>
nnoremap <Leader>d :Gdiffsplit<CR>
nnoremap <Leader>c :Git commit<CR>
nnoremap <Leader>b :Git blame<CR>
" git grep the current word under the cursor
nnoremap <Leader>g :Ggrep <cword><CR>

augroup FugitiveCommands
    autocmd!
    " automatically open quickfix window after :Ggrep
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ctrlp
let g:ctrlp_regexp = 1

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_case_insensitive=1

" local config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
