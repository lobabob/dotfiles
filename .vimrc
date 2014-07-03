"           VIM CONFIG FILE
"---------------------------------------

" tab = 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

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
"set autoread

" Ignore case when searching
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Allows you to remove highlighting after done with search
nnoremap <CR> :noh<CR><CR>

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

" Dark background
"set background=dark

" Highlight text over 80 columns wide
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%80v.*/

