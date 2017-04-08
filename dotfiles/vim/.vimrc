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
"source /usr/share/vim/vim80/defaults.vim

" Clipboard
set clipboard=unnamedplus
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" Search
:set ignorecase

" netrw (default nerdtree)
set nocompatible
filetype plugin on

" Colors
syntax on

