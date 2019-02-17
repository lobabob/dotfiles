"       Install Plugins
"----------------------------

" vim-plug handles this automatically
" filetype plugin indent on

" Install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugin directory (avoid standard vim dir names like "~/.vim/plugin")
call plug#begin('~/.vim/bundle')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-speeddating'
Plug 'airblade/vim-gitgutter'

Plug 'daviesjamie/vim-base16-lightline'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

call plug#end()

"     Configure Plugins
"----------------------------

" ----------------
"    gitgutter
" ----------------

"let g:gitgutter_terminal_reports_focus=0
set updatetime=200

" ----------------
"    indentLine
" ----------------

set list lcs=tab:\┊\
let g:indentLine_char='┊'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_enabled = 1

" ----------------
"    lightline
" ----------------

set laststatus=2    " Allows statusbar to show up with one window
set showtabline=2   " Allows the tabline to show up with one window

"let g:lightline.colorscheme = 'base16'
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['branch', 'readonly', 'filename'] ],
  \   'right': [ ['column'],
  \              ['percent'],
  \              ['fileformat', 'fileencoding'] ],
  \ },
  \ 'component': {
  \   'column': 'Col:%c',
  \   'percent': '%p%%',
  \ },
  \ 'component_function': {
  \   'branch': 'LightlineGitBranch',
  \   'filename': 'LightlineFilename',
  \ },
\ }

let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type   = { 'buffers': 'tabsel' }
let g:lightline#bufferline#unnamed = '[No Name]'

" Ignore branch symbol if running within WSL
let platform = substitute(system(". ~/.bash_functions; get_platform"), '\n\+$', '', '')

function! LightlineGitBranch()
  let branch = gitbranch#name()
  let prefix = g:platform == 'WSL' ? '': '⎇ '

  return branch != '' ? prefix.branch : ''
endfunction

" Combines modified status with the filename
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

"          Vim Configuration
"---------------------------------------

"set nofoldenable

" start searching before pressing enter
set incsearch

" number of context lines above and below the cursor
set scrolloff=1

" tab = 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" Enable line numbers
set number

" Keeps paste buffer when switching file buffers
set hid

" Turn on syntax highlighting
syntax on

" Auto-tab new lines to match previous line
set autoindent
set copyindent

" Auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Allows you to remove highlighting after done with search
nnoremap <CR> :noh<CR><CR>

" Don't show mode in last line of screen. Lightline already does that.
set noshowmode

" Highlight the current line
"set cursorline

" Adds hotkeys to cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif

set mouse=a

" Simpler split navigation
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" Pane resizing
nnoremap <M-j> <C-W>-
nnoremap <M-k> <C-W>+
nnoremap <M-l> <C-W>>
nnoremap <M-h> <C-W><lt>
nnoremap <Esc>j <C-W>-
nnoremap <Esc>k <C-W>+
nnoremap <Esc>l <C-W>>
nnoremap <Esc>h <C-W><lt>

" Simpler pane splitting
nnoremap <M-=> :vsp<CR>
nnoremap <M--> :sp<CR>
nnoremap <Esc>= :vsp<CR>
nnoremap <Esc>- :sp<CR>

" Causes new split locations to match intuition
set splitright 
set splitbelow

" Visual word wrapping
"set wm=4
"set lbr
"set wrap

" Better command-line completion
set wildmenu

" Highlight text over 80 columns wide
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%80v.*/

" ----------------
"   colorscheme
" ----------------

" Set to 256 colors
set t_Co=256

colorscheme wombat256

" ----------------
" colorscheme overrides
" ----------------

highlight LineNr ctermbg=none

"let g:gitgutter_override_sign_column_highlight = 1
"highlight SignColumn ctermbg=none

highlight GitGutterAdd ctermbg=none ctermfg=2
highlight GitGutterChange ctermbg=none ctermfg=12
highlight GitGutterDelete ctermbg=none ctermfg=1
highlight GitGutterChangeDelete ctermbg=none ctermfg=5

