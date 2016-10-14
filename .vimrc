" ------- VIMRC CONFIGURATION -------
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
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on
" reload files changed outside vim
set autoread         
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
inoremap '' `
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

" New Mapping for Arrow Keys

nnoremap j h
nnoremap k j
nnoremap i k
nnoremap l l

" Navigation through TABS

nnoremap L gt
nnoremap J gT

" Navigation through PANES

nnoremap <C-L> <C-W><C-L> 
nnoremap <C-J> <C-W><C-H> 
nnoremap <C-K> <C-W><C-J> 
nnoremap <C-I> <C-W><C-K> 

" Change . to : in command mode
nnoremap . :
" Remap . behaviour
nnoremap - .

" Make uppercase
nnoremap mu <esc>viwUviw<esc>

" Replace work with yanked one
nnoremap riw viwp

" New Operators
" Select inside parenthesis
onoremap p i(
" Select all the word 
onoremap w iw
onoremap ' i'
" Select till end of the line
onoremap e $

" Fast movement through text
nnoremap œ 10k
nnoremap º 10j
nnoremap ª b

nnoremap <Esc>l 10l
nnoremap <Esc>j 10h
nnoremap <Esc>i 10k
nnoremap <Esc>k 10j

nnoremap ¬ e

nnoremap el g$
nnoremap ej g^

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

" }}}
" Commands {{{

com! FormatJSON %!python -m json.tool

" }}}
" Leader Mappings {{{

" Set the leader key
let mapleader = ","
nnoremap <leader>c :set cursorline!<CR>
" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR> 

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
    au FileType javascript set foldmethod=syntax
    au BufEnter,BufRead *.html set foldmethod=indent
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END

" }}}
" Vundle Plugins {{{

" initiate Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
"let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin() " let Vundle manage Vundle, required Plugin 'gmarik/Vundle.vim' 

" Plugin's List
Plugin 'itchyny/lightline.vim'      
Plugin 'kien/ctrlp.vim'         
Plugin 'mattn/emmet-vim'
"Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'gcmt/taboo.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'helino/vim-json'
Plugin 'junegunn/vim-easy-align'
"Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'wesQ3/vim-windowswap'
Plugin 'scrooloose/syntastic'
Plugin 'maksimr/vim-jsbeautify'

" end plugin definition
call vundle#end()            " required for vundle

" }}}
" Plugin Config {{{

" EMMET
let g:user_emmet_leader_key='<C-z>'

" LIGHTLINE
let g:lightline = {
            \ 'colorscheme' : 'wombat',
            \ }
set laststatus=2

" JAVASCRIPT SYNTAX
let g:used_javascript_libs='angularjs,angularuirouter,jquery'

" TABOO
set sessionoptions+=tabpages,globals

" YOU COMPLETE ME 
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" TERN FOR VIM
let g:term_map_keys=1
let g:tern_show_argouments_hint='on_hold'

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }

" Syntastic Checker Enables
let g:syntastic_css_checkers = ['prettycss']
let g:syntastic_js_checkers = ['jshint']

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
" }}}
