" Use ; for commands
"nnoremap ; :

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

inoremap jk <esc>
inoremap <esc> <nop>

vnoremap òò <esc>
vnoremap <esc> <nop>
let mapleader = ","

" Simply edit and source this config file
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR> 
nnoremap <leader>if gg=G 
nnoremap <leader>fs :setlocal foldmethod=syntax<CR>
nnoremap <leader>ep :Files<CR>
