set nocompatible
set encoding=utf-8

set fileformat=unix
set termencoding=utf-8
set termguicolors    " use more than 256 colors in a terminal

set backspace=indent,eol,start
set nobackup noswapfile
set incsearch hlsearch
set formatoptions=croqj

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
set shiftwidth=4                    " Num spaces for indent
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
" Font
"
" set guifont=Consolas:h11
" set guifont=ProFontWindows:h11
set guifont=Dina:h11


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
  au ColorScheme * hi Normal ctermbg=none guibg=none
endif


" .--------------.
" | Line Numbers |"
" '--------------'
"
set nu                              " set line numbers on
set rnu                             " set relativenumber

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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/seoul256.vim'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  "Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-surround'

  Plug 'editorconfig/editorconfig-vim'
"  Plug 'gpanders/editorconfig.nvim'

  "Plug 'prabirshrestha/asyncomplete.vim'      " These 2 are for autocompletion
  "Plug 'prabirshrestha/asyncomplete-lsp.vim'  " in addition to vim-lsp
  "Plug 'prabirshrestha/vim-lsp'               " vim language server protocol support
  "Plug 'prabirshrestha/asyncomplete-buffer.vim'
  "Plug 'mattn/vim-lsp-settings'               " Make it easy as vscode to install language servers.
  "Plug 'mattn/vim-lsp-icons'

  " For ccls
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'lighttiger2505/deoplete-vim-lsp'
  "Plug 'jackguo380/vim-lsp-cxx-highlight'

  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

  " Plug 'thaerkh/vim-workspace'
  " Plug 'rhysd/git-messenger.vim'
  " Plug 'jreybert/vimagit'

  Plug 'flazz/vim-colorschemes'
  Plug 'oka-h/yozakura.vim'

  "if has('nvim') || has('patch-8.0.902')
  "  Plug 'mhinz/vim-signify'
  "else
  "  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  "endif

  "Plug 'dhruvasagar/vim-table-mode'
  "

  Plug 'ludovicchabant/vim-gutentags'

  " Intelligently remember last place in files, folds, etc.
  Plug 'farmergreg/vim-lastplace'

  " COQ_NVIM Fast AF
  " main one
  " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  " Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

  " Plug 'neovim/nvim-lspconfig'

  "Plug 'codota/tabnine-vim'

  Plug 'ziglang/zig.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'} 

"  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

call plug#end()

" Python3 Provider configuration
let g:python3_host_prog = '/usr/local/bin/python3.9'

" Register ccls C++ lanuage server.
"if executable('ccls')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
"      \ 'allowlist': ['c', 'cpp', 'cc'],
"      \ })
"endif


"
" .-----------.
" | mapleader |"
" '-----------'
"
let mapleader = ','


""""""""""""""""""""""""""""
" nvim-gdb 
""""""""""""""""""""""""""""
" to disable it:
"let g:loaded_nvimgdb = 1
" for help do   :help nvimgdb


""""""""""""""""""""""""""""
" vim-lsp
""""""""""""""""""""""""""""

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:lsp_auto_enable = 1
let g:lsp_preview_float = 1 " Opens preview windows as floating

let g:lsp_completion_documentation_enabled = 1
let g:lsp_completion_documentation_delay = 120

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1

let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_use_event_queue = 1
let g:lsp_semantic_enabled = 1
let g:lsp_work_done_progress_enabled = 1


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
"
"
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif"

" The query history for this command will be stored as 'ls' inside g:fzf_history_dir.
" The name is ignored if g:fzf_history_dir is not defined.
command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
nnoremap <silent> <leader>k :Rg<SPACE>
nnoremap <silent> <leader>. :Rg <C-R><C-W><CR>
nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>B :Buffers<CR>

function! s:append_dir_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'find . -type d',
    \ 'sink': {line -> feedkeys("\<esc>:".a:line.line, 'n')}}))
  return ''
endfunction

cnoremap <expr> <c-x><c-d> <sid>append_dir_with_fzf(getcmdline())

" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" }}}



"   _   _                     _     _____                      
"  | \ | |   ___   _ __    __| |   |_   _|  _ __    ___    ___ 
"  |  \| |  / _ \ | '__|  / _` |     | |   | '__|  / _ \  / _ \
"  | |\  | |  __/ | |    | (_| |     | |   | |    |  __/ |  __/
"  |_| \_|  \___| |_|     \__,_|     |_|   |_|     \___|  \___|
                                                             
" nerdtree {{{
nnoremap <silent> <leader>N :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeWinSize = 35
" }}}

"
"
" Custom commands and mappings {{{
com! -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

" vim-table-mode {{{
let g:table_mode_corner='|'
noremap <leader>tth {{3jo
" }}}

" vimrc {{{
nnoremap <leader>ev :vs ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" }}}

noremap <leader>B :Buffers<cr>
noremap <leader>j :%!python3 -m json.tool<cr>
noremap <leader>J :set syntax=json<cr>

noremap <leader>nn :tabNext<cr>
noremap <leader>pp :tabPrevious<cr>

"
" Prettier
"
nnoremap <F5> :!prettier --write %<CR>

" .--------------.
" | Color Scheme |"
" '--------------'
"
"colorscheme yozakura
"colorscheme moon

"" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" let g:seoul256_background = 256
" colo seoul256
set background=dark


"
" Home-grown snippets
"
map <leader>ss iconst<SPACE>char*<SPACE><ESC>
map <leader>sc O<ESC>:r /mnt/data/vimsnippets/c/comments_template.c<CR>kdd
map <leader>sb i_Bool<SPACE>
map <leader>sn s<CR>{<CR>}<ESC>ka<CR>

"
" :make
"
" Full build
:set makeprg=$HOME/scripts/do_build.sh
map <leader>bb :make full<CR>
map <leader>b :make incr<CR>
map <leader>bd :make docs<CR>
map <leader>bz :make size<CR>
map <leader>bs :make static<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif


"
" Status Line
"
"   from github.com/jwel/minstat
"
" get the git branch 
function! GitBranchName()
  return FugitiveHead()
endfunction

function! CurByteAsHex()
    let l:c = char2nr(matchstr(getline('.'),'\%'.col('.').'c.'))
    return printf('0x%04x',l:c)
endfunction

set statusline=

" git branch name
set statusline+=%#PmenuSel#
set statusline+=\ 
set statusline+=⛕
set statusline+=\ %{GitBranchName()}\ 

" file path
set statusline+=%#LineNr#
set statusline+=\ %F

" some file status as applicable
set statusline+=%m
set statusline+=%r
set statusline+=%h

set statusline+=%= " begin right align

" line and column
set statusline+=%#PmenuSbar#
set statusline+=\ %l
set statusline+=:
set statusline+=%c\ 

" percent of file
set statusline+=%#Normal#
set statusline+=\ %p%%

" byte code of character under cursor in hex
set statusline+=%#NonText#
set statusline+=\ %{CurByteAsHex()}

" buffer number
set statusline+=%#NonText#
set statusline+=\ [%n]
set statusline+=\ 

" always show the status line
set laststatus=2

