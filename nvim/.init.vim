" ------- NVIMRC CONFIGURATION -------
" Colors {{{"{{{

" set the color theme to wombat256
colorscheme wombat256mod
" make a mark for column 80
set colorcolumn=80
" and set the mark color to DarkSlateGray
highlight ColorColumn ctermbg=lightgray guibg=lightgray
" Set 256 colors in Vim
set t_Co=256
" turn on syntax highlighting
syntax on
" Highlight current line
hi CursorLine cterm=NONE ctermbg=234 
set cursorline
" set Adobe's Source Code Pro font as default
"set guifont=Source\ Code\ Pro

" }}}"}}}
" General {{{
if has('gui_running')
    set guifont=Lucida_Console:h11
endif

if &shell =~# 'fish$'
    set shell=sh
endif

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" Show the choices when inserting commands
set wildmenu

" Show matching parentesis
set showmatch

" Reload changed  files
set autoread

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile
" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end
" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" don't make vim compatible with vi 
set nocompatible
set nocp

filetype indent on

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8
" and show line numbers
set numberwidth=5
set relativenumber
set number
" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden
" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos
" save up to 100 marks, enable capital marks
set viminfo='100,f1
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw
" Set the correct position of splitting
set splitbelow
set splitright

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" }}}
" Mappings {{{

" Set foldmethod=syntax
nnoremap fd :execute ':set foldmethod=syntax'<CR>

" Cancella testo tra due virgole
nnoremap ci, T,ct,

" select all mapping
noremap <leader>a ggVG

" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']
" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 

" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '

" Vertical split with CtrlP
nnoremap vv <C-w>v<cr>:CtrlP<cr>
" Horizontal split with CtrlP
nnoremap hh :split<cr>:CtrlP<cr>
" New tab split with CtrlP
nnoremap tt :tabe<cr>:CtrlP<cr>

" Space in normal mode for code folding
nnoremap <space> za

" Custom Commands
command! Vsp :execute ':vsplit | CtrlP<CR>'
command! Ef :CtrlP

" Reimplement i behaviuor
nnoremap I i

" Slash e Pipe remapped
"inoremap < \ 
"inoremap > \|

" Add Bakctick for Markdown
"inoremap '' `
" Go To Previus/Next Location of pointer
" Previus
nnoremap <C-o> <C-o> 
" Next
nnoremap <C-p> <C-i> 

" Disable arrow keys during insert mode

inoremap OB <nop>
inoremap OD <nop>
inoremap OC <nop>
inoremap OA <nop>

" Fast CopyPaste
"inoremap <C-v> :execute ':set paste | ' 

" New Mapping for Arrow Keys
nnoremap j h
nnoremap k j
nnoremap i k
nnoremap l l

vnoremap j h
vnoremap k j
vnoremap i k
vnoremap l l

" Navigation through TABS
nnoremap L gt
nnoremap J gT

" Navigation through PANES
"nnoremap <C-J> <C-W><C-H> 
"nnoremap <C-I> <C-W><C-K> 
"nnoremap <C-K> <C-W><C-J> 
"nnoremap <C-L> <C-W><C-L> 

let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-k> :TmuxNavigateDown<cr>  
nnoremap <silent> <c-i> :TmuxNavigateUp<cr>  
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>  
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>  

" Change . to : in command mode
nnoremap . :
" Remap . behaviour
nnoremap - .

" Make uppercase
nnoremap mu <esc>viwUviw<esc>
inoremap <c-U> <esc>viwUea

" Replace work with yanked one
nnoremap riw viwp

" New Operators
" Select inside parenthesis
onoremap p i(
" Select all the word 
onoremap w iw
onoremap ' i'

" Fast movement through text
nnoremap <Esc>i 10k
nnoremap <Esc>k 10j

"nnoremap E e
nnoremap B 0 
nnoremap E $

nnoremap rl g$
nnoremap rj g^

" Mapping for ><

"inoremap \ <
"inoremap \| >

" Mapping for |\
"inoremap < \
"inoremap > |

" Crea una linea prima o dopo quella attuale senza uscire dal command mode
nnoremap <S-ENTER> O<Esc>
nnoremap <CR> o<Esc>

inoremap jk <esc>
inoremap <esc> <nop>

vnoremap òò <esc>
vnoremap <esc> <nop>

" }}}
" Commands {{{

com! FormatJSON %!python -m json.tool

" }}}
" Leader Mappings {{{

" Set the leader key
let mapleader = ","
" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR> 
nnoremap <leader>if gg=G 
nnoremap <leader>fs :setlocal foldmethod=syntax<CR>
nnoremap <leader>ep :CtrlP<CR>

" }}}
" Search {{{

set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>
" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>
" TODO map CtrlP

" }}}
" Spaces & Tabs {{{

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces set softtabstop=4   

" }}}
" AutoGroups {{{

" On file types...
augroup FileTypes
    autocmd!
    "   .md files are markdown files
    autocmd BufNewFile,BufRead *.md setlocal ft=markdown
    "   .twig files use html syntax
    autocmd BufNewFile,BufRead *.twig setlocal ft=html
    "   .less files use less syntax
    autocmd BufNewFile,BufRead *.less setlocal ft=less
    "   .jade files use jade syntax
    autocmd BufNewFile,BufRead *.jade setlocal ft=jade
augroup END

augroup typescript_fold
    autocmd!
    au FileType typescript set foldmethod=syntax
    au FileType typescript set shiftwidth=2 
    au FileType typescript set tabstop=2 
    au BufNewFile,BufRead *.ts set shiftwidth=2 
    au BufNewFile,BufRead *.ts set foldmethod=syntax
    au BufRead,BufNewFile *.ts  setfiletype typescript
augroup END

augroup javascript_fold
    autocmd!
    au FileType javascript set foldmethod=syntax
    au FileType javascript set shiftwidth=2 
    au BufNewFile,BufRead *.js set shiftwidth=2 
    au BufNewFile,BufRead *.js set foldmethod=syntax
augroup END

augroup css_fold
    autocmd!
    au BufEnter,BufRead *.css set foldmethod=marker
augroup END

augroup html_fold
    autocmd!
    au BufEnter,BufRead *.html setlocal foldmethod=indent
    au BufRead,BufWritePre *.html :normal gg=G
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
    au BufEnter,BufRead vim set foldmethod=marker
augroup END

augroup filetype_php 
    autocmd!
    au BufEnter,BufRead *.php setlocal foldmethod=indent
augroup END

augroup filetype_comment
    autocmd!
    autocmd FileType python      nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType javascript  nnoremap <buffer> <leader>c I//<esc>
augroup END
augroup filetype_iabbrev
  autocmd!
  autocmd FileType python      :iabbrev <buffer> iff if:<left>
  autocmd FileType javascript  :iabbrev <buffer> iff if ()
augroup END

augroup filetype_vue
  autocmd!
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
  autocmd BufRead,BufNewFile *.vue setlocal foldmethod=indent
augroup END

augroup filetype_rust
  autocmd!
  autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
  "autocmd BufRead,BufNewFile *.rs setlocal foldmethod=indent
augroup END

augroup filetype_toml
    autocmd!
    autocmd BufNewFile,BufRead *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,Pipfile setlocal filetype=toml
augroup END


" Cpp Autocompletion
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" }}}
