" vimrc custom configuration file
" Maintainer:	Gerardo Galindez 
" Created:	    10/Sep/2012
" Version:      0.1
" Sections:
"    -> General [GEN]
"    -> Keymaps [KEY]
"    -> Vim UI [VUI]
"    -> Files and backups [FIL]
"    -> Editing [EDT]
"    == Done, supposedly ===============
"
"    -> Visual mode related [VIS]
"    -> Moving around, tabs and buffers [VIW]
"    -> Status line [STA]
"
"    -> Editing mappings []
"    -> vimgrep searching and cope displaying []
"    -> Spell checking []
"    -> Misc []
"    -> Helper functions []
" References: 
"    -> Amix vimrc [http://amix.dk/vim/vimrc.html]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General [GEN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set to auto read when a file is changed from the outside
set autoread

" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Keymaps [KEY]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use . as :
nore . :

" Key Mappings
let mapleader = ","
map <Leader>bn :bnext<cr>
map <Leader>bN :bprevious<cr>
map <Leader>bd :bdelete<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Giga save. Handle with care
nmap <leader>w :wall!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing position aid
set number
set ruler
set cul
set showmatch	
set backspace=indent,eol,start " Allow backspacing over everything

" Vim command line and Wildmenu
set wildmenu
set wildignore=*~,*.swp
set showcmd	
set cmdheight=1

" Search options
set ignorecase
set smartcase
set incsearch		" Real time match
set magic           " Regex magic

" Don't redraw while executing macros
" Note: Dooesn't looks as cool
set lazyredraw

" Bells are ugly
set novisualbell
set noerrorbells
set t_vb=

colorscheme megara
syntax on
set t_Co=256        " 256 color term 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files [FIL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Filetypes
filetype plugin indent on
augroup vimrcEx
au!
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 4-space tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Use spaces for tabs
set expandtab
set smarttab

" Indent
set autoindent
set smartindent
set wrap

"--------------------------------------------------------------------------
"- Previous Vimrc (Dirty) -------------------------------------------------
"--------------------------------------------------------------------------



" Editor typing settings

autocmd WinEnter,FileType   ruby  set sts=2 ts=2 sw=2

