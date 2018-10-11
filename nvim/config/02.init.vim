" init.vim contains all of the initialization plugins for vim
" note that this has to be sourced second since dein needs to
" run its scripts first. This contains misc startup settings
" for vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable syntax highlighting
syntax on

" Fixes backspace
set backspace=indent,eol,start

" Enable line numbers
set nu

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line

" keep the cursor visible within 10 lines when scrolling
set scrolloff=10

" Autoindentation
set ai
filetype indent plugin on

" Copies using system clipboard
set clipboard+=unnamedplus

" Tab = 4 spaces
set tabstop=2
set shiftwidth=2
set sta
set et
set sts=2

" enable mouse support
set mouse=a mousemodel=popup

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


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

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
set numberwidth=5
set number
set relativenumber

" use ripgreg instead of grep
set grepprg=rg\ --vimgrep

" Set colors in terminal
" Solarized, dark, with true color support
set termguicolors
set background=dark
colorscheme NeoSolarized

" Set the correct position of splitting
set splitbelow
set splitright

" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" set unix line endings
set fileformat=unix

" close vim if only window left is nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

set hidden

" Disable completion where available from ALE
" (not worth creating a separate file just for a one-liner)
let g:ale_completion_enabled = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" terminal settings
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" No lazy redraw for redraw bug
set nolazyredraw
