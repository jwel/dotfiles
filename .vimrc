set nocompatible
set encoding=utf-8

set fileformats=unix,mac,dos
set termencoding=utf-8
set termguicolors    " use more than 256 colors in a terminal

set backspace=indent,eol,start
set nobackup noswapfile
set incsearch hlsearch
set fo=croqj

" undo persistence
set undodir=~/.vim/undo
set undofile

syntax on
filetype plugin indent on

set mouse=a                         " automatically enable mouse usage
set noerrorbells visualbell t_vb=   " no annoying sound on errors
set shortmess+=OI
set completeopt+=noinsert,noselect
set completeopt-=preview            " disable autocomplete preview
set nowrap                          " Do not wrap long lines
set autoindent                      " Indent at the same level of the previous line
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set softtabstop=4                   " Let backspace delete indent
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vertical split windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set pastetoggle=<F12>               " paste toggle (sane indentation pastes)
set signcolumn=yes                  " always enable signcoumn
set cmdheight=2
set wildmenu " Show file options above the command line
set wildmode=list:longest,full



"
" .---------------.
" | Auto Commands |
" '---------------'
"
if !exists("autocmds_loaded")
  let autocmds_loaded = 1
  augroup CLikeFileTypes
    au!
    au BufRead *.c     set cindent
    au BufRead *.cpp   set cindent
  augroup END
  augroup vimrcFileType
    au!
    au FileType vim set tabstop=2 shiftwidth=2 softtabstop=2
  augroup END
endif

" .--------------.
" | Line Numbers |"
" '--------------'
"
set nu                              " set line numbers on
set rnu                             " set relativenumber

" .--------------.
" | Color Scheme |"
" '--------------'
"
set background=dark
" colorscheme darkblue


"
" ,-.----.                                                                             
" \    /  \     ,--,                                                                   
" |   :    \  ,--.'|                                 ,--,                              
" |   |  .\ : |  | :             ,--,              ,--.'|          ,---,               
" .   :  |: | :  : '           ,'_ /|    ,----._,. |  |,       ,-+-. /  |   .--.--.    
" |   |   \ : |  ' |      .--. |  | :   /   /  ' / `--'_      ,--.'|'   |  /  /    '   
" |   : .   / '  | |    ,'_ /| :  . |  |   :     | ,' ,'|    |   |  ,"' | |  :  /`./   
" ;   | |`-'  |  | :    |  ' | |  . .  |   | .\  . '  | |    |   | /  | | |  :  ;_     
" |   | ;     '  : |__  |  | ' |  | |  .   ; ';  | |  | :    |   | |  | |  \  \    `.  
" :   ' |     |  | '.'| :  | : ;  ; |  '   .   . | '  : |__  |   | |  |/    `----.   \ 
" :   : :     ;  :    ; '  :  `--'   \  `---`-'| | |  | '.'| |   | |--'    /  /`--'  / 
" |   | :     |  ,   /  :  ,      .-./  .'__/\_: | ;  :    ; |   |/       '--'.     /  
" `---'.|      ---`-'    `--`----'      |   :    : |  ,   /  '---'          `--'---'   
"   `---`                                \   \  /   ---`-'                             
"                                         `--`-'                                       
"
call plug#begin('~/.vim/plugged')
    Plug 'leafgarland/typescript-vim'
    Plug 'leafo/moonscript-vim'
    Plug 'ianks/vim-tsx'

    Plug 'lifepillar/vim-mucomplete'
    Plug 'Quramy/tsuquyomi'

    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

    Plug 'thaerkh/vim-workspace'
    Plug 'rhysd/git-messenger.vim'
    Plug 'jreybert/vimagit'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()


"
" .--------.
" | Leader |"
" '--------'
"
let mapleader = ','

"      ___         ___           ___   
"     /  /\       /  /\         /  /\  
"    /  /:/_     /  /::|       /  /:/_ 
"   /  /:/ /\   /  /:/:|      /  /:/ /\
"  /  /:/ /:/  /  /:/|:|__   /  /:/ /:/
" /__/:/ /:/  /__/:/ |:| /\ /__/:/ /:/ 
" \  \:\/:/   \__\/  |:|/:/ \  \:\/:/  
"  \  \::/        |  |:/:/   \  \::/   
"   \  \:\        |  |::/     \  \:\   
"    \  \:\       |  |:/       \  \:\  
"     \__\/       |__|/         \__\/  

" fzf {{{
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
nnoremap <Leader>r :Rg<SPACE>
" }}}

"
"  ______                                             _ 
" /_  __/______  ______ ___  ____  ______  ____ ___  (_)
"  / / / ___/ / / / __ `/ / / / / / / __ \/ __ `__ \/ / 
" / / (__  ) /_/ / /_/ / /_/ / /_/ / /_/ / / / / / / /  
"/_/ /____/\__,_/\__, /\__,_/\__, /\____/_/ /_/ /_/_/   
"                  /_/      /____/                      

" tsuquyomi {{{
let g:tsuquyomi_completion_detail = 1
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript setlocal completeopt+=menu,preview
let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
inoremap <Leader>c <c-x><c-o>
nnoremap <Leader>d :TsuDefinition<CR>
nnoremap <Leader>s :TsuSplitDefinition<CR>
nnoremap <Leader>rf :TsuReferences<CR>
nnoremap <Leader>rn :TsuRenameSymbol<CR>
nnoremap <Leader>rnn :TsuRenameSymbolC<CR>
nnoremap <Leader>q :TsuQuickFix<CR>
nnoremap <Leader>e :TsuGeterr<CR>
" }}}

"
" ___ ___  __ __     __   ___   ___ ___  ____   _        ___  ______    ___ 
" |   |   ||  |  |   /  ] /   \ |   |   ||    \ | |      /  _]|      |  /  _]
" | _   _ ||  |  |  /  / |     || _   _ ||  o  )| |     /  [_ |      | /  [_ 
" |  \_/  ||  |  | /  /  |  O  ||  \_/  ||   _/ | |___ |    _]|_|  |_||    _]
" |   |   ||  :  |/   \_ |     ||   |   ||  |   |     ||   [_   |  |  |   [_ 
" |   |   ||     |\     ||     ||   |   ||  |   |     ||     |  |  |  |     |
" |___|___| \__,_| \____| \___/ |___|___||__|   |_____||_____|  |__|  |_____|
                                                                           
" mucomplete {{{
set completeopt-=preview
set completeopt+=longest,menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
" }}}

" vimrc {{{
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}



"   _   _                     _     _____                      
"  | \ | |   ___   _ __    __| |   |_   _|  _ __    ___    ___ 
"  |  \| |  / _ \ | '__|  / _` |     | |   | '__|  / _ \  / _ \
"  | |\  | |  __/ | |    | (_| |     | |   | |    |  __/ |  __/
"  |_| \_|  \___| |_|     \__,_|     |_|   |_|     \___|  \___|
                                                             
" nerdtree {{{
nnoremap <silent> <leader>n :NERDTreeFind<CR>
nnoremap <silent> <leader>N :NERDTreeToggle<CR>
" }}}

