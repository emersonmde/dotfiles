filetype off

" =========== Vundle Config ===========
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" NERDTree File system explorer
Plugin 'scrooloose/nerdtree'
" Git flags for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Syntax Checking
Plugin 'scrooloose/syntastic'

" Deoplete completion
Plugin 'shougo/deoplete.nvim'

" Make it easy to surround text with quotes/brackets/braces
Plugin 'tpope/vim-surround'

" Statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Auto pair for adding/removing brances/parens/etc
Plugin 'jiangmiao/auto-pairs'

" Languages
" Go
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Required for deoplete-go
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
Plugin 'zchee/deoplete-go', { 'do': 'make' }

" Used for selecting visual indented text objects
Plugin 'michaeljsmith/vim-indent-object'

call vundle#end()
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

" ------ vim-go ------
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" ------ Airline ------
let g:airline_theme='luna'

" =========== Other Config-ish Stuff ===========
set encoding=utf-8
set clipboard=unnamedplus,unnamed,autoselect
set mouse=a

syntax on

set nocompatible
set backspace=2

" Set relative line numbers
set number relativenumber

