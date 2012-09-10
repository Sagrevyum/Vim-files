" vimrc custom configuration file
" Maintainer:	Gerardo Galindez 
" Created:	    10/Sep/2012
" Version:      0.1
" Sections:
"    -> General [GEN]
"    -> Keymaps [KEY]
"    -> Vim user interface [GUI]
"    -> Colors and fonts [COL]
"    == Done, supposedly ===============
"    -> Files and backups [FIL]
"    -> Text, tab and indent related [TXT]
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
" -> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Filetypes
" Note: autocmds will probably be in another section
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Keymaps
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
" -> Vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show the line numbers
set number
" Show the cursor position
set ruler
" Display incomplete commands
set showcmd	
" Show the matching symbol
set showmatch	
" Ignore temp files
set wildignore=*~,*.swp
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Vim command line height
set cmdheight=1
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Don't redraw while executing macros
" Note: Dooesn't looks as cool
set lazyredraw
" Regex magic
set magic
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------------------------------
"- Previous Vimrc (Dirty) -------------------------------------------------
"--------------------------------------------------------------------------

set autoindent		" always set autoindenting on



" Plugin configuration
" MiniBufExpl
"let g:miniBufExplorerMoreThanOne=0


" Searching
set incsearch		" do incremental searching
set hlsearch		" highlight search match

colorscheme epegzz

" Editor typing settings
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

autocmd WinEnter,FileType   ruby  set sts=2 ts=2 sw=2

" Highlight the currently selected line
" NOTE: 256 terminal colors must be enabled
set t_Co=256		" use 256 colors
set cul			" set the horizontal line 
hi CursorLine term=none cterm=none ctermbg=16

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"  set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else


endif " has("autocmd")
