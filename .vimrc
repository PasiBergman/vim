set enc=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" set backupcopy=auto
" syntax on
" set autoindent
" set autowrite
" set sw=4
" set notextmode
" set notextauto
" set hlsearch
" set incsearch
" set wildmenu
"
set nocompatible              " be iMproved, required
filetype off                  " required


if has("gui_running")
  if has('gui_macvim')
    " set guifont=Meslo\ LG\ S\ DZ:h15
    set rtp+=~/.vim/bundle/Vundle.vim
    set guifont=Menlo:h15
  elseif has("gui_gtk2")
    set guifont=Inconsolata\ 12
    set rtp+=~/.vim/bundle/Vundle.vim
  elseif has("gui_win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    set guifont=Consolas:h13:cANSI
    " set guifont=Meslo\ LG\ S\ DZ:h11
    " set guifont=Menlo:h11
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
  endif
else
  set term=xterm-256color
  set rtp+=~/.vim/bundle/Vundle.vim
endif

" Set the window size
if has("gui_running")
  set lines=40 columns=140
else
  " This is console Vim.
  " if exists("+lines")
  "   set lines=44
  " endif
  " if exists("+columns")
  "   set columns=140
  " endif
endif

" set the runtime path to include Vundle and initialize
if has("gui_win32")
    call vundle#begin(path)
else
    call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/tComment'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'maciakl/vim-neatstatus'
Plugin 'PProvost/vim-ps1'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" CtrlP
set runtimepath^=$VIM/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'SOME_BAD_SYMBOLIC_LINKS', }
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

set laststatus=2
set statusline=%f\ \ line:%l/%L\ col:%c\ %p%%\ %y

" Easymotion
let g:EasyMotion_leader_key = ','

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if has('mac')
  if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
  endif
elseif has('win32')
  if filereadable(expand("~/_vimrc.before"))
    source ~/_vimrc.before
  endif
elseif has('win64')
  if filereadable(expand("~/_vimrc.before"))
    source ~/_vimrc.before
  endif
endif



" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim


if has("autocmd")
" TypeScript files
  augroup tsc
    autocmd BufRead,BufNewFile *.ts set filetype=tsc
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
  augroup END
endif

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" Map jj to Esc
imap jj <Esc>

" More mappings
"
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" j and k will handle wrapped lines also.
nnoremap j gj
nnoremap k gk
" I can type :help on my own, thanks.
noremap <F1> <Esc>

" Map + to $ (easier on Finnish keyboard)
map + $

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if has('mac')
  if filereadable(expand("~/.vim/vundles.vim"))
    source ~/.vim/vundles.vim
  endif
elseif has('win32')
  if filereadable(expand("~/vimfiles/vundles.vim"))
    source ~/vimfiles/vundles.vim
  endif
elseif has('win64')
  if filereadable(expand("~/vimfiles/vundles.vim"))
    source ~/vimfiles/vundles.vim
  endif
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

if has('mac')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
elseif has('win32')
  silent !mkdir ~/vimfiles/backups
  set undodir=~/vimfiles§/backups
elseif has('win64')
  silent !mkdir ~/vimfiles/backups
  set undodir=~/vimfiles§/backups
endif
set undofile

" ================ Indentation ======================

filetype plugin on
filetype indent on

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set ignorecase
" set smartcase

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Mappings

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Pathogen
" execute pathogen#infect()

" Automatically open NERDTree if vim is opened without file(s)
" autocmd vimenter * if !argc() | NERDTree | endif

" Automatically close vim if NERDTree is the only one left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <f8> :NERDTreeToggle<CR>

" Other autocommands
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufRead,BufWritePre *.ps1 normal gg=G
autocmd BufRead,BufWritePre *.js normal gg=G
autocmd BufRead,BufWritePre *.css normal gg=G

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8                     " better default than latin1
    setglobal fileencoding=utf-8           " change default file encoding when writing new files
    set fileencodings=ucs-bom,utf-8,latin1
endif

" Simple re-format for minified Javascript
command! UnMinifyJs call UnMinifyJs()
function! UnMinifyJs()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Show tabs, trailing whitespace and nonbraking speace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Use dash - for :
nnoremap - :

" Set vim to use OS clipboard with y and p (in OS X)
set clipboard=unnamed

nnoremap <F12>f :exe ':silent !firefox-developer %'<CR>
nnoremap <F12>c :exe ':silent !chromium-browser %'<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>

silent !mkdir ~/.vim/.backup > /dev/null 2>&1
silent !mkdir ~/.vim/.undo > /dev/null 2>&1
silent !mkdir ~/.vim/.swp > /dev/null 2>&1

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

colorscheme onedark
