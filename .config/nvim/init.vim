filetype off

" =========== Include Plugins ===========
call plug#begin()

" Deoplete completion
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" NERDTree File system explorer
Plug 'scrooloose/nerdtree'

" Git flags for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax Checking
Plug 'scrooloose/syntastic'

" Make it easy to surround text with quotes/brackets/braces
Plug 'tpope/vim-surround'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto pair for adding/removing brances/parens/etc
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'mhinz/vim-janah'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

"" Used for selecting visual indented text objects
Plug 'michaeljsmith/vim-indent-object'

call plug#end()

filetype plugin indent on

" =========== Plugin Config ===========
" MAKE IT SO!

" ------ NERDtree ------
"  Open NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Close VIM if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree if VIM is opened on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ------ Syntastic ------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go']

" ------ Deoplete ------
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ------ Airline ------
"let g:airline_theme='luna'
let g:airline_theme='onedark'


" =========== Other Config-ish Stuff ===========
set encoding=utf-8
syntax on

set nocompatible
set backspace=2

" Theme Config
"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme janah
set termguicolors
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
colorscheme onedark

filetype plugin indent on
syntax on
set number relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set nobackup
set noswapfile

set linebreak
set showbreak=+++
set textwidth=100
set showmatch
"set spell
set visualbell

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set mouse=a
set clipboard+=unnamed
