"Basic vim config>{
set number
set ruler
set nobackup
set lazyredraw
set tabstop=2
set shiftwidth=2
set expandtab
set autochdir
set mouse=a
set smartindent
set autoindent
set nocompatible
set backspace=2
set ignorecase
set smartcase
set hidden
set enc=utf-8
syntax on
filetype plugin indent on
"}

"Test config {
set wildmenu
set wildignore=*pyc,*exe,*dll,*png,*jpg
set wildmode=list:longest
"}

"Tabs {
map	<C-TAB>		gt
map	<C-S-TAB>	gT
"}

"Buffers Mappings {
"map <CR>  <C-]>
map j     gj
map k     gk
"}

"Windows Mappings {
map <C-h>   :wincmd h<CR>
map <C-j>   :wincmd j<CR>
map <C-k>   :wincmd k<CR>
map <C-l>   :wincmd l<CR>
map <A-S-k> <C-w>-
map <A-S-j> <C-w>+
map <A-S-h> <C-w><
map <A-S-l> <C-w>>
"}

"Filetype assoc{
autocmd BufNewFile,BufRead,BufEnter *py set omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufRead,BufEnter *py so ~\myVimFiles.git\pythonConfig.vim
autocmd BufNewFile,BufRead,BufEnter *nsi so ~\myVimFiles.git\nsis.vim
autocmd BufNewFile,BufRead,BufEnter *txt call CheckLang()
autocmd BufNewFile,BufRead,BufEnter *tmp call CheckLang()
"}

"My search in files function
function SearchInFiles()
  let s:word=input("Buscar -> ")
  let g:_files=input("En -> ")
  exec ":lvimgrep /".s:word."/gj ".g:_files
  exec ":lw"
  unlet s:word
  unlet g:_files
endfunction

function ReplaceInFiles()
  let s:word=input("Reemplazar -> ")
  let g:_files=input("Con -> ")
  unlet s:word
  unlet g:_files
endfunction

"Other Stuff {
map <F2>  :!sh -login -i<CR><CR>
map <F3>  :call SearchInFiles()<CR>
map <F4>  :TlistToggle<CR>
imap <F2>  <ESC>:!sh -login -i<CR><CR>
imap <F3>  <ESC>:call SearchInFiles()<CR> 
imap <F4>  :TlistToggle<CR>
imap <C-Space>  <C-x><C-o>
"}
"
"FUF{
map <F5> :FufBuffer<CR>
imap <F5> <Esc>:FufBuffer<CR>
"}

"Folds {
set foldenable
set foldmarker={,}
set foldmethod=marker
set foldlevel=100
function SimpleFoldText() "{
  return getline(v:foldstart).' '
endfunction "}
set foldtext=SimpleFoldText()
"}

"Languge correcting settings {
function CheckLang()
  map	<F6>  :setlocal spell spelllang=es<CR>
  map	<F7>  :setlocal spell spelllang=en<CR>
  map <F8>  :call EndCheckLang()<CR>
  map n  ]s
  map c  z=
  map N [s
  imap	<F6>  <ESC>:setlocal spell spelllang=es<CR>
  imap	<F7>  <ESC>:setlocal spell spelllang=en<CR>
endfunction

function EndCheckLang()
  setlocal nospell
  unmap n
  unmap N
  unmap c
endfunction
"}
