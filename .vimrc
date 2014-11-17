" [status line]
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" [文字コード]
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac

" 文字コードの設定
set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set ff=unix

" [インデント]
set smartindent
set smarttab
set smartcase

filetype on
filetype plugin indent on

set tabstop=2 "An indentation level every four columns"
set expandtab "Convert all tabs typed into spacces"
set shiftwidth=4 "Indent/outdent by four columns"

augroup vimrc
au BufNewFile,BufRead *.scss setf css
au BufNewFile,BufRead *.slim setf html
au BufRead,BufNewFile *.md set filetype=markdown
autocmd! FileType perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType php  setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" [検索]
syntax on
set hlsearch
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
set noincsearch
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" [その他]
set number
set paste
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" -- markdown
Plugin 'plasticboy/vim-markdown'

" -- html5
Plugin 'othree/html5.vim'

" -- css
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
