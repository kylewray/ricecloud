" General and GUI
" ---------------

" This to do with the system-wide configuration;
" it must be first. It enables 'vim' instead of 'vi'.
set nocompatible

" Set the command height to be 1 unit tall.
set cmdheight=1

" Enable line numbers. Make them relative
set number
set relativenumber

" Set 'hidden' which means it hides buffers instead
" of closing them. Thus, you can open already opened
" files and undo (provided buffer is still open).
set hidden

" Disable swap files.
set nobackup
set noswapfile


" Highlighting
" ------------

" Enable syntax highlighting with a color scheme.
"colorscheme wombat256mod
syn on

" Change the color of the pop-up menus to be more muted.
highlight Pmenu ctermbg=yellow guibg=yellow
"highlight PmenuSel ctermbg=black guibg=black
highlight PmenuSbar ctermbg=black guibg=black
highlight PmenuThumb ctermbg=darkgray guibg=darkgray

" Show matching parenthesis.
set showmatch

" Assign files with non-standard extensions to use syntax highlighting.
au BufRead,BufNewFile *.cls,*.sty set syn=tex
au BufRead,BufNewFile *.cu set syn=cpp

" Enable spell-checking for text files.
au BufRead,BufNewFile *.txt,*.tex,*.cls,*.sty set spell


" Tabs and Spacing
" ----------------

" Auto and smart indentation. Optionally, return and auto-indent
" once a certain number of characters is reached.
set autoindent
set smartindent

" Set wrap and line break. First we set the default: no wrap and no linebreak.
" Then, we override this with wraps and linebreaks on words only for text files.
set nowrap
set nolinebreak
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
"set wrap
"set linebreak
"set textwidth=120
"set wrapmargin=0

" Setup the tabs to be 4 spaces.
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" Insert tabs according to shiftwidth, not tabstop.
" Also, use multiple shift widths with '>' or '<'.
set shiftwidth=4
set shiftround
set smarttab

" For some file types, intelligently use different indenting.
"filetype plugin indent on


" Searching
" ---------

" Enable searching for case-sensitive only when capital
" letters are used; otherwise, it is case-insensitive.
set ignorecase
set smartcase

" Setup searching so that it highlights search terms
" as well as does it on-the-fly.
set hlsearch
set incsearch

" Remember lots of commands and undo levels.
set history=1000
set undolevels=1000

" Disable beeping.
set novisualbell
set noerrorbells

" Enable wildmenu for tab completion when opening files
" or typing commands.
set wildmode=longest:full,full
set wildmenu


" Keyboard and Mouse
" ------------------

" Disable the arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Remap : to ;. This saves time in the long run.
nnoremap ; :

" Remap up and down (k and j) to move over wrapped lines.
nnoremap j gj
nnoremap k gk

" Use control+move to navigate multiple files.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Allow backspace to work properly in all modes.
set backspace=indent,eol,start

" Enable the mouse for selecting text.
set mouse=a
"set ttymouse=xterm2

" All input interactions should be fast.
set ttyfast


" Packages
" --------

call plug#begin()

" Include powerline for a pretty statusline.
Plug 'https://github.com/itchyny/lightline.vim'

" Include NERDTree for file/project browsing.
Plug 'https://github.com/scrooloose/nerdtree'

" Include vim-visual-multi for multiple cursors.
"Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/mg979/vim-visual-multi'

" Include julia synatx highlighting and unicode support.
Plug 'https://github.com/JuliaEditorSupport/julia-vim'

" Include conquer of completion (coc) for code completion.
" CocInstall coc-json coc-html coc-css coc-tsserver coc-python coc-julia
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

set encoding=UTF-8

call plug#end()


" Package Customization and Commands
" ----------------------------------

" Make the statusline show always. This allows the lightline to be shown.
set laststatus=2

" The default vim statusline is not needed anymore. Disable it.
set noshowmode

" Map NERDTree to ctrl+o.
map <C-o> :NERDTreeToggle<CR>

" Always use 'LatexToUnicode' (julia-vim); this the allows '\' unicode command.
let g:latex_to_unicode_file_types = ".*"

