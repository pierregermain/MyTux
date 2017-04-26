"--------------------------------------------------
">>> BEGIN VUNDLE
"--------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugins to be used
Plugin 'nelsyeung/twig.vim'

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
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" Search
:set ignorecase

" Undo
set undofile " Maintain undo history between sessions
set undodir=~/.vimundo

" Save read only files with :w!!
cmap w!! w !sudo tee % >/dev/null

" Colors
syntax on

" netrw (default filemanager)
" Use <C-^>
set nocompatible
filetype plugin on

" Disable automatic comment insertion in new lines
"autocmd FileType * setlocal formatoptions-=r " Insert Mode
"autocmd FileType * setlocal formatoptions-=c " Auto-wrap
autocmd FileType * setlocal formatoptions-=o  " Open Line

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
