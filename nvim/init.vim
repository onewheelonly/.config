" PLUG-INS
" --------
" Install vim-plug if not already there
let vimfilesdir = expand('~/.local/share/nvim/site')
let plugdir = vimfilesdir.'/autoload/'
if empty(glob(plugdir))
    silent execute '!curl -fLo '.plugdir.'plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vimfilesdir.'/plugged')

Plug 'nanotech/jellybeans.vim' " Jellybeans colour scheme
Plug 'morhetz/gruvbox' " gruvbox colour scheme
Plug 'justinmk/vim-sneak' " Get around easier!
Plug 'moll/vim-bbye' " Allows buffer to be closed without closing split
Plug 'scrooloose/nerdtree' " Navigation plugin
Plug 'kien/ctrlp.vim' " CtrlP - for file navigation
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim' " Fuzzy file finder
Plug 'vim-airline/vim-airline' " Nicer status line, shows buffers at top.
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' " Display git status in margin
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-repeat' " Fixes . for some plugins
Plug 'tpope/vim-surround' " Surround stuff with things like quotes
Plug 'tpope/vim-commentary' " Easy commenting
Plug 'sheerun/vim-polyglot' " Various language packs
Plug 'Notre1/as400.vim' " Syntax highlighting for RPG code
Plug 'andlrc/rpgle.vim' " Syntax highlighting for RPG code
Plug 'leafgarland/typescript-vim' " Typescript highlighting
Plug 'w0rp/ale' " Linting
Plug 'ludovicchabant/vim-gutentags' " Automatic Ctags update
Plug 'kkoenig/wimproved.vim' " Windows gvim tweaks
Plug 'luochen1990/rainbow' " Rainbow coloured parentheses

call plug#end()            

" BITS I LIKE FROM $VIMRUNTIME/vimrc_exmample.vim
" -----------------------------------------------

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80

" APPEARANCE/BEHAVIOUR
" --------------------
colorscheme jellybeans
let g:airline_theme="bubblegum"

set laststatus=2 "Always show status line
set nowrap
set number
set nobackup
set noundofile
set ignorecase
set smartcase
set incsearch		
set relativenumber
set wildmenu
set hidden
set lazyredraw
set mouse=a

" Scroll when moving past top/bottom 4 lines
set scrolloff=4

" GVIM OPTIONS
" ------------
set gfn=DejaVu_Sans_Mono_for_Powerline:h10
set guioptions=gm

if has("gui_running")
    set lines=36 columns=120
endif

" A little bit of transparency. For fanciness :-)
autocmd GUIEnter * silent! WSetAlpha 250

" INDENTING/SYNTAX HIGHLIGHTING
" -----------------------------
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

if has("autocmd")
    filetype plugin indent on
else
    set smartindent
endif

" PLUG-IN OPTIONS
" ---------------
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%*

"let g:netrw_altv = 1
"let g:netrw_browse_split = 4

let g:EasyMotion_smartcase = 1

" This means directories open on single click, but files need double click
let g:NERDTreeMouseMode = 2

"Ignore 'target' directories to make CtrlP file find faster
let g:ctrlp_custom_ignore = 'target\'
let g:ctrlp_by_filename = 0

"This is for Ctags. This makes it so that it checks the current directory for
"a tags file, and then recursively searches parents to find one.
set tags=tags;/

let g:gutentags_define_advanced_commands=1

" Turn off gutentags if we don't have CTags installed
if !executable('ctags')
    let g:gutentags_dont_load=1
endif

"Rainbow parens initially switched off
let g:rainbow_active = 0

let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1

let g:sneak#label = 1

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" CUSTOM MAPPINGS
" ---------------
map <SPACE> <Leader>

" Make it easier to move between windows
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

" Easy move between buffers
map <Leader>p :bp!<cr>
map <Leader>n :bn!<cr>

" Plugin shortcuts
nnoremap <Leader>b :CtrlPBuffer<cr>
nnoremap <Leader>d :Bdelete<cr>
nnoremap <Leader>E :NERDTree<cr>
nnoremap <Leader>e :NERDTreeFind<cr>
nnoremap <Leader>F :WToggleFullscreen<cr>
nnoremap <Leader>f :CtrlP<cr>
nnoremap <Leader>m :CtrlPMRU<cr>
nnoremap <Leader>r :RainbowToggle<cr>

" Remap z for horizontal shifting for that we move a bit quicker
nnoremap zl z20l
nnoremap zh z20h
