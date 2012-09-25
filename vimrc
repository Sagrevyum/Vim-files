" vimrc custom configuration file
" Maintainer:	Gerardo Galindez 
" Created:	    10/Sep/2012
" Version:      0.1
" Sections:
"    -> General [GEN]
"    -> Keymaps [KEY]
"    -> Vim UI [VUI]
"    -> Files [FIL]
"    -> Editing [EDT]
"    -> Autocmds and lang specific [AUT]
"    -> Helpers [HLP]
"    -> Plugin configuration [PGC]
" References: 
"    -> Amix vimrc [http://amix.dk/vim/vimrc.html]
"    -> VimCasts [http://vimcasts.org]
"    -> Gary Berhardt [https://github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"    -> The authors of the plugins. To be stated in my next commit, in the
"       readme file of Github

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
""""""""""""""
" Vim keymaps
""""""""""""""
" Use . as :
nore . :
let mapleader = ","

" Paste from the clipboard without indenting
set pastetoggle=<Leader>p

" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bN :bprevious<cr>
map <Leader>bd :bdelete<cr>

" Window keymaps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>

"""""""""""""""""
" Plugin keymaps
"""""""""""""""""
""""""""""
" NERDTree
""""""""""
nmap <leader>nt :NERDTreeToggle<cr>

""""""""""""""""""""
" Commentary keymaps
""""""""""""""""""""
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>CommentaryUndo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing position aid
set number
set numberwidth=4
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

syntax on
colorscheme megara
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

" Return to last edit position
autocmd BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing [EDT]
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Autocmds and lang specific [AUT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd!

" Set [...] to 2-space indent
autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sts=2 ts=2 sw=2 

" Text -> Git, Asciidoc
autocmd FileType text setlocal textwidth=80

" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass 

" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Helpers [HLP]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plugin configuration [PGC]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" NERDTree
""""""""""
" Open NERDTree if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
