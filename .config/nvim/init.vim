filetype off

" =========== Include Plugins ===========
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

" Deoplete completion
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" NERDTree File system explorer
Plug 'scrooloose/nerdtree'

" Git flags for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Show git diff flags in gutter
Plug 'airblade/vim-gitgutter'

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
Plug 'gosukiwi/vim-atom-dark'

"" Used for selecting visual indented text objects
Plug 'michaeljsmith/vim-indent-object'

" Treat camelcase and snakecase as words
Plug 'bkad/CamelCaseMotion'

" Helps with commenting code
Plug 'scrooloose/nerdcommenter'

" Switch panes and VIM splits with ctrl+hjkl
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy file finding
Plug 'kien/ctrlp.vim'

" Languages
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }

call plug#end()

filetype plugin indent on

" Leader - ( Spacebar )
let mapleader = ","

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

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ------ Airline ------
"let g:airline_theme='luna'
let g:airline_theme='onedark'



" ------ CTRLP ------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" CameCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>')

" Map iw, ib, and ie motions
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


" ----- AutoPairs -----
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
au filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'} " Don't autocomplete in vim

" ----- GO -----
let g:go_fmt_command = "goimports"

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
colorscheme atom-dark-256

filetype plugin indent on
syntax on
set number relativenumber
set nobackup
set noswapfile

" Searching
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

set linebreak
set showbreak=+++
set textwidth=100
"set spell
set visualbell

set autoindent
set smartindent
set smarttab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set ttyfast
set mouse=a
set clipboard+=unnamed


set autowrite
set autoread
"au FocusGained,BufEnter * :silent! !
set undofile

" Save when switching windows
"au FocusLost,WinLeave * :silent! wa

"Set default font in mac vim and gvim
set guifont=Inconsolata\ for\ Powerline:h24
set cursorline    " highlight the current line
set wildmenu
set wildmode=list:longest,full


" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>

 resize panes
 nnoremap <silent> <Right> :vertical resize +"5<cr>
 nnoremap <silent> <Left> :vertical resize -5<cr>
 nnoremap <silent> <Up> :resize +5<cr>
 nnoremap <silent> <Down> :resize -5<cr>

 " navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
