# Which is my Leader
search mapleader in vimrc (by default \, I use ,)

#Wrap lines visually
:set wrap linebreak nolist

#Spell
:set spelllang=es
:set spelllang=en
:set spell
:set nospell
]s | search next
[s | search next
zg | Add good word
zw | Add wrong word
z= | suggest

#Paste

,pp | paste in new line

"+p | paste clipboard
"+y | yank to clipboard

#Move cursor
H | move cursor height
M | move cursor middle
L | move cursor left

#Scroll
CTRL-D: Page down
CTRL-U: Page up
CTRL-E: Scroll down one line
CTRL-Y: Scroll up one line

zl | Horizontal Right
zh | Horizontal Left

#Mark
m | mark current line and position
z | position current line
' | move to marked line
` | move to marked line and position
''| back

#Windows
^Wh Go Left
^Wl Go Right

^Wv Split Vertically
^Wn Split Horizontall

^Wc Close Window
^Wo Close Others

^WR Go Up
^Wr Go Down

#Search

`*`      | search current selection
`#`      | `*` backward
:noh     | no highlight
,ff      | Display all lines of cursor word

#Omnicomplete

<C-x><C-o> Open Onmicomplete
:pclose    close

#Php
:php -l % Check syntax

#Show whitespace vs tabs
:syntax on
:set list
:set syntax=whitespace

#Count Words
g<Ctr-G>

# Set Filetype
:set ft=php 
:set ft=html
:set ft=phtml

--------
#PLUGINS
--------

#PHP PIV
K | PHP Documentation

#Tabularize

,a= | Tabularizar por el carácter *a*

#EasyMotion
,,w | word forward
,,w | end of word forward
,,b | back

#Surround

ds"     | delete surround "
cs])    | change surround ] to )
cs"<q>  | change surround with <q>txt</q>
ysW(    | surround word with (
vllllS' | visual surround

#Nerdtree

:NERDTree  | open Nerd Tree
<C-E> | Toggle Nerd Tree

#Nerdcommenter
,cc       | comment
,c<space> | toggle comment

#Fugitive Git
,gs | git status
,fc | find merge conflicts

--------
# CUSTOM
--------

#Fold (plugin)
,f0 unfold all
,f1 fold all level 1
,f9 fold all level 9

#Tabs (plugin)
,tn | :tabnew
,tc | :tabclose
,to | :tabonly

,t, |:tabnext
,tl | lasttab

,tm | :tabmove

#Select (plugin)

vit | select text inside html
vat | select text around html

yit | yank text inside html
yat | yank text around html

daw | delete all word
yaw | yank all word


#Sessions (plugin)
,sl | sessionList
,ss | sessionSave
,sc | sessionClose


#Reload Configuration (plugin)
,sv


#TODO's

#Tagbar

# vim:set sw=2 ts=2 et:
