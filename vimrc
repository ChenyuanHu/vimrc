set nocompatible

set nobackup
set noswapfile

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set fileencodings=cp936,gb18030,gbk,gb2312,utf-8,ucs-bom,latin-1
set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8

set dir=.

set backspace=indent,eol,start

syntax on

filetype on

filetype plugin on

" no auto change line
" set nowrap

set showmatch

set hlsearch

"set ignorecase

set incsearch

set laststatus=2
" set statusline=%F\ (%l,%c)\ %P
set statusline=%F%=[%{&ff}\ %Y]\ [0x\%02.2B]\ (%l,%v)\ %p%%

set cc=80

set scrolloff=5 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" set no autoindent
set noai

set nu

highlight linenr ctermfg=6
highlight linenr ctermbg=0

highlight StatusLine ctermfg=7 ctermbg=0

set nuw=1

set tags=tags;
set autochdir

set cscopequickfix=s-,c-,d-,i-,t-,e-

set title

set foldcolumn=1
set foldmethod=manual

set foldlevel=9

" set t_Co=256

"helptags ~/.vim/doc

let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1

let Tlist_Ctags_Cmd='/usr/bin/ctags'

map <F9> :TlistToggle<CR>

let g:doxygenToolkit_authorName="Huchenyuan"
let g:doxygenToolkit_briefTag_funcName="yes"

nmap - :Dox<CR>

"if has("cscope")
if 0
    set csprg=/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
       let cscope_file=findfile("cscope.out", ".;")
       let cscope_pre=matchstr(cscope_file, ".*/")
       if !empty(cscope_file) && filereadable(cscope_file)
           exe "cs add" cscope_file cscope_pre
       endif      
     endif
endif

 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

nmap <C-u> :tabp<CR>
nmap <C-i> :tabn<CR>

nmap 8 :tabnew<CR>:e .<CR>

nmap 9 :tp<CR>zt
nmap 0 :tn<CR>zt

function SearchSelText()
    let max = 10
    let prj_dir = './'
    let i = 0
    let break = 0
    while isdirectory(prj_dir) && i < max
        if filereadable(prj_dir . 'tags') || filereadable(prj_dir . 'prj__')
            let word = expand("<cword>")
            execute 'vimgrep /\<'. word . '\>/ ' . prj_dir . '**/*.c ' . prj_dir . '**/*.h'
            execute 'cw'
            break
        endif
        let prj_dir = prj_dir . '../'
        let i = i + 1
    endwhile
endf
"    :vimgrep /\<<C-R>=expand("<cword>")<CR>\>/ prj_dir<CR> :cw<CR>

nmap <F3> :cp<CR>zt
nmap <F4> :cn<CR>zt
nmap <F2> :call SearchSelText()<CR>
"nmap <F2> :vimgrep /\<<C-R>=expand("<cword>")<CR>\>/ **/*<CR> :cw<CR>

map <F11> :set mouse=<CR>
map <F12> :set mouse=a<CR>

vmap <F6> :!cat >> /tmp/hcy_clipboard<CR>u
vmap <F7> :!cat > /tmp/hcy_clipboard<CR>u
map <F8> :r /tmp/hcy_clipboard<CR>

"map :help vim-script-intro
