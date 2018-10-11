" Install Vim-Plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'padawan-php/deoplete-padawan', { 'for': 'php', 'do': 'composer install' }
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs', 'for': 'php'}
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips' | Plug 'phux/vim-snippets'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'
Plug 'gcmt/taboo.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-obsession'
Plug 'ekalinin/Dockerfile.vim'

Plug 'sickill/vim-monokai'
Plug 'iCyMind/NeoSolarized'
Plug 'flazz/vim-colorschemes'
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources = {}
let g:deoplete#sources.php = ['padawan', 'ultisnips', 'tags', 'buffer']

" needed for echodoc to work if add_parentheses is 1
let g:deoplete#sources#padawan#add_parentheses = 1

" cycle through menu items with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" no need for diagnostics, we're going to use neomake for that
let g:LanguageClient_diagnosticsEnable  = 0
let g:LanguageClient_signColumnAlwaysOn = 0

" This slows down Nvim a lot 
let g:vue_disable_pre_processors=1

" New Leader key for Emmet
let g:user_emmet_leader_key='<C-Z>'

"enable all function in all mode
let g:user_emmet_mode='a'    

let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" PHP7
let g:ultisnips_php_scalar_types = 1

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
" vim powerline options
let g:airline_theme='solarized'

" don't overwrite symbols if they already exist
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 1

" split pane navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Delete trailing whitespace with F5
":nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" nerdtree
" autocmd vimenter * NERDTree " start nerdtree automatically when vim starts up
map <C-n> :NERDTreeToggle<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" keybindings for language client
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_codeAction()<CR>
" I only use these 3 mappings
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap K :call LanguageClient_textDocument_hover()<cr><Paste>

" ALE
nmap <F8> <Plug>(ale_fix)

" fzy
nnoremap <C-p> :Files<CR>
"
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Expands or completes the selected snippet/item in the popup menu
imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
      \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_jump_or_expand)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neovim visor
let g:neovim_visor_key = '<C-a>'

" change working directory to where the file in the buffer is located
" if user types `,cd`
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" <ESC> exits in terminal mode
tnoremap <ESC> <C-\><C-n><C-w><C-p>

" Easy most-recent-buffer switching
nnoremap <Tab> :buffers<CR>:buffer<Space>

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

" Reimplement i behaviuor
nnoremap I i

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
"nnoremap L gt
"nnoremap J gT

nnoremap <M-l>  gt
nnoremap <M-j>  gT


" Navigation through PANES
"nnoremap <C-J> <C-W><C-H> 
"nnoremap <C-I> <C-W><C-K> 
"nnoremap <C-K> <C-W><C-J> 
"nnoremap <C-L> <C-W><C-L> 

"let g:tmux_navigator_save_on_switch = 1
"let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-k> :TmuxNavigateDown<cr>  
nnoremap <silent> <C-i> :TmuxNavigateUp<cr>  
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>  
nnoremap <silent> <C-j> :TmuxNavigateLeft<cr>  

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
nnoremap <M-i> 10k
nnoremap <M-k> 10j

" Fast movement through text
vnoremap <M-i> 10k
vnoremap <M-k> 10j

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

inoremap <M-.> >
inoremap <M-,> <

" Crea una linea prima o dopo quella attuale senza uscire dal command mode
nnoremap <S-ENTER> O<Esc>
nnoremap <CR> o<Esc>

vnoremap jk <esc>

inoremap jk <esc>

let mapleader = ","

" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR> 
nnoremap <leader>if gg=G 
nnoremap <leader>ep :Files<CR>

augroup filetype_syntax
    au!
    au FileType vue setlocal foldmethod=indent
    au FileType php setlocal foldmethod=indent
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

augroup yml_folding
    au!
    au FileType yaml.docker-compose setlocal foldmethod=indent
augroup END
" update tags in background whenever you write a php file
"
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' & 

" only start lsp when opening php files
au filetype php LanguageClientStart

" use LSP completion on ctrl-x ctrl-o as fallback for padawan in legacy projects
"au filetype php set omnifunc=LanguageClient#complete

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
