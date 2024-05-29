" 機能型
"" 互換モードの廃止(要先頭記述)
set nocompatible
"" コマンドの履歴を10000件残す
set history=10000
"" 行を跨いでのカーソル移動を有効にする
set whichwrap=b,s,h,l,<,>,[,]
"" w!!でsudoを忘れても保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
"" バックスペースの有効化
set backspace=indent,eol,start
"" 左右スクロールは一文字づつ行う
set sidescroll=1
"" 左右スクロール時の視界を確保
set sidescrolloff=8
"" 文字コードの設定
set encoding=utf-8
"" vimのマルチバイトへの対応
scriptencoding utf-8
"" 保存時の文字コード
set fileencoding=utf-8
" NeoVimのインストール確認
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" プラグインの個別記載
" カラースキームのvim-code-darkを導入
NeoBundle 'tomasiser/vim-code-dark'
" ステータスラインの情報を強化
NeoBundle 'itchyny/lightline.vim'
" 末尾のスペースを強調表示
NeoBundle 'bronson/vim-trailing-whitespace'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
" Markdown構文
NeoBundle 'joker1007/vim-markdown-quote-syntax'
" 軽量なファイラー
NeoBundle 'scrooloose/nerdtree'
" Control + f ファイラーのオンオフ
nnoremap <silent><C-f> :NERDTreeToggle<CR>
" テキストを囲む
NeoBundle 'tpope/vim-surround'
" NeoVimの設定系
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" code-darkが存在すれば有効化する
if neobundle#is_installed('vim-code-dark')
    colorscheme codedark
endif
" 表示系
"" ステータスラインを表示
set laststatus=2
"" カーソル行の背景色を変える
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!
"" 上下4行の視界を確保
set scrolloff=4
"" カラーbitの指定
set t_Co=256
"" 括弧入力時の対応する括弧を表示
set showmatch
"" 入力中のコマンドを表示
set showcmd
"" 現在のモードを表示する
set showmode
"" 編集中のファイル名を表示
set title
"" カーソルの位置表示を有効にする
set ruler
"" キャレットの形状変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"if has('vim_starting')
"    " 挿入モード時に非点滅の縦棒タイプのカーソル
"    let &t_SI .= "\e[6 q"
"    " ノーマルモード時に非点滅のブロックタイプのカーソル
"    let &t_EI .= "\e[2 q"
"    " 置換モード時に非点滅の下線タイプのカーソル
"    let &t_SR .= "\e[4 q"
"endif
"let &t_SI = "\e]50;CursorShape=1\x7"
"let &t_EI = "\e]50;CursorShape=0\x7"
""" コードの色分け
syntax enable
"" □ や○ 文字が崩れる問題を解決
set ambiwidth=double
"" 対応する括弧の強調表示
set showmatch
source $VIMRUNTIME/macros/matchit.vim
"" 長文が表示されなくなる問題の解決
set display=lastline
" 入力補助系
"" オートインデント
set smartindent
"" smartindentで増減する幅
set shiftwidth=4
"" インデントのスペースを設定
set tabstop=4
"" タブ入力を複数の空白入力に置き換える
set expandtab
"" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
"" ペースト時の自動インデント
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"
    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"" 改行時に前の行のインデントを継続する
set autoindent
" 検索系
"" 大文字と小文字を区別しない
set ignorecase
"" インクリメンタルサーチを行う
set incsearch
"" 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set smartcase
"" 検索文字列をハイライトする
set hlsearch
"" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan
"" 貼り付け時にインデントを無効化
set paste

set number
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=./tags;,tags;

"キー配置変更
nnoremap U <C-r>
nnoremap J 10<Down>
nnoremap K 10<Up>
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap gk :tabedit
nnoremap gj :bd<CR>
nnoremap gJ :q!<CR>
nnoremap tl <C-]>
nnoremap th <C-t>
nnoremap cL c$
nnoremap cH c^
nnoremap dL c$
nnoremap dH c^
nnoremap gh gT
nnoremap gl gt
nnoremap zj zt
nnoremap zk zb
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>
nnoremap ff *:vimgrep /<C-r>// **/*.{cpp,hpp,c,h,py,pyx}

vnoremap v <C-v>
vnoremap , <ESC>ggVG
vnoremap H ^
vnoremap L $
vnoremap J 10<Down>
vnoremap K 10<Up>

autocmd QuickFixCmdPost *grep* cwindow

augroup vimrc
  autocmd!
  au BufWritePost ~/.vim/vimrc so ~/.vim/vimrc
  au BufWritePost ~/.vim/vimrc !gsutil cp ~/.vim/vimrc gs://to-funostrage/.vim/vimrc
"  au InsertLeave,BufLeave,TextChanged * :w
augroup END

augroup main
  autocmd!
augroup END

"" 制御文字関連
autocmd main BufWinEnter *
  \  if &modifiable
  \|   nnoremap <buffer> <Tab> i<Tab>
  \|   nnoremap <buffer> <BS> i<BS><ESC>
  \| else
  \|   nunmap <buffer> <Tab>
  \|   nnoremap <buffer> <BS>
  \| endif

nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Space><CR> o<ESC>

