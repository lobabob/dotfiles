"           VIM CONFIG FILE
"---------------------------------------

"set nofoldenable
set paste

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

" Don't show mode in last line of screen. Airline already does that.
set noshowmode

" Highlight the current line
set cursorline

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
nnoremap <M-\> :vsp<CR>
nnoremap <M--> :sp<CR>
nnoremap <Esc>\ :vsp<CR>
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

" Show partial commands in the last line of the screen
"set showcmd

" Set to 256 colors
set t_Co=256

" Buffers screen updates instead of updating all the time
"set lazyredraw

" Colorscheme stuff if any
"colorscheme 256-jungle
"colorscheme jellybeans
"colorscheme kolor
"colorscheme molokai

set background=light
colorscheme wombat256mod

" Highlight text over 80 columns wide
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%80v.*/

"       Plugin stuff
"----------------------------

execute pathogen#infect()
filetype plugin indent on

"***** indentLine
set list lcs=tab:\|\
let g:indentLine_char='|'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_enabled = 1

"***** vim-airline
" Customized sections of statusbar
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create(['ffenc', 'hunks'])
  let g:airline_section_y = airline#section#create(['L:%l', ' ', 'C:%c'])
  let g:airline_section_z = airline#section#create_right(['%p%%'])

  " Displays ASCII value of char hovered over by cursor in hex
  "let g:airline_section_z = airline#section#create_right(['%B'])

  "let g:airline_section_b = '%{strftime("%c")}'
  "let g:airline_section_y = 'BN: %{bufnr("%")}'
endfunction
autocmd VimEnter * call AirlineInit()

set laststatus=2    " Allows statusbar to show up with one window

" Custom Seperator for statusbar
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Tabline options
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" fugitive integration with airline (fugitive is git wrapper)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = "|"
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#branch#empty_message = ''

