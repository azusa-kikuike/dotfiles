"==<indent>================================================
set tabstop=4 "An indentation level every four columns"
set expandtab "Convert all tabs typed into spacces"
set shiftwidth=4 "Indent/outdent by four columns"
set shiftround   "Always indent/outdent to the nearest tabstop"

"==<decorate>===============================================
syntax on
set hlsearch
set showmatch

"==<search>=================================================
set noincsearch
set wrapscan

"==<status line>============================================
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"==<font encoding judge>====================================

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

set autoindent
set number
set paste

"let g:outputz_secret_key = 'q7eHdU2Xv5dJ'
"let g:outputz_uri_function= 'http://localhost/vim'

nmap <F2> :Tlist<CR>
let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"    "ctagsのパス
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる
"let Tlist_Use_Right_Window = 1            "右側でtaglistのウィンドーを表示

filetype on
filetype plugin on

let g:acp_enableAtStartup = 1
