"--------------------------------------------------
">>> BEGIN VUNDLE
"--------------------------------------------------
"
" Launch vim and run :PluginInstall
"
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugins to be used
Plugin 'nelsyeung/twig.vim'
" Markdown toc
Plugin 'mzlogin/vim-markdown-toc'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" Vim Surround
Plugin 'tpope/vim-surround'
" Tagbar (sudo apt-get install exuberant-ctags)
Plugin 'majutsushi/tagbar'
" Nice Debugger (sudo apt-get install python3-dev)
"Plugin 'vim-vdebug/vdebug'


" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes
filetype plugin on " required
"
"--------------------------------------------------
"<<< END VUNDLE
"--------------------------------------------------
"
"Get Vim Defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Clipboard
set clipboard=unnamedplus
" set clipboard=
set mouse=r
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" Search
:set ignorecase
:set hlsearch

" Undo
set undofile " Maintain undo history between sessions
set undodir=~/.vimundo

" Save read only files with :w!!
cmap w!! w !sudo tee % >/dev/null

" Colors
syntax on

" Linenumbers
set relativenumber
set number

" Disable automatic comment insertion in new lines
"autocmd FileType * setlocal formatoptions-=r " Insert Mode
"autocmd FileType * setlocal formatoptions-=c " Auto-wrap
autocmd FileType * setlocal formatoptions-=o  " Open Line

"--------------------------------------------------
" netrw (default filemanager)
"--------------------------------------------------
" Use <C-^>
set nocompatible
filetype plugin on

"--------------------------------------------------
" Leader key Shortcuts
"--------------------------------------------------

" Define Leader Key
let mapleader = ","

nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>, :NERDTreeFind<cr>
nmap <leader>t :TagbarToggle<cr>

"--------------------------------------------------
"NERTREE
"--------------------------------------------------

" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 
" No help line
let NERDTreeMinimalUI=1

"--------------------------------------------------
"DRUPAL
"--------------------------------------------------

" Spaces and Tabs (Drupal)
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

" Omnicomplete (TODO: ctags)
" Invoke with <C-x> <C-o>
" <C-p> Previous
" <C-n> Next
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"--------------------------------------------------
" CHULETA (activated with <Leader-h>
"--------------------------------------------------

let g:chuletaOpen = 0
let s:call_chuleta = '<leader>h'

execute "noremap " . s:call_chuleta " :call <SID>call_chuleta()<CR>"

function! s:call_chuleta()
        wincmd w
        call <SID>ExpandFilenameAndExecute("vsplit", "~/.vim/chuleta.md")
endfunction

function! s:ExpandFilenameAndExecute(command, file)
        if !g:chuletaOpen
          execute a:command . " " . expand(a:file, ":p")
          let g:chuletaOpen = 1
        else
          execute bufwinnr("~/.vim/chuleta.md") . "wincmd q"
          let g:chuletaOpen = 0
        endif
endfunction

