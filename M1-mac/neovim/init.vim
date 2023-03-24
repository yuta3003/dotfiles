"--------------------------------------
" BASE Setting
"--------------------------------------
"

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

set shell=/bin/zsh

set nobackup    "  バックアップファイルを作らない
set noswapfile  "  スワップファイルを作らない
set autoread    "  編集中のファイルが変更されたら自動で読み直す
set hidden      "  バッファが編集中でもその他のファイルを開けるように
set showcmd     "  入力中のコマンドをステータスに表示する
set autoindent  "  改行時インデントを継続
set nocompatible    "  vi互換をオフ
set backspace=indent,eol,start  "  BackSpace 有効化

set list listchars=tab:\▸\-     "  不可視文字を可視化(タブが「▸-」と表示される)
set expandtab                   "  Tab文字を半角スペースにする
set tabstop=2                   "  行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=2                "  行頭でのTab文字の表示幅

set textwidth=0 "  ワードラッピングなし
set ignorecase  "  検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase   "  検索文字列に大文字が含まれている場合は区別して検索する
set incsearch   "  検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan    "  検索時に最後まで行ったら最初に戻る
set hlsearch    "  検索語をハイライト表示
set clipboard=unnamed "  クリップボードへ登録
nmap <Esc><Esc> :nohlsearch<CR><Esc>    "  ESC連打でハイライト解除

inoremap <silent> jj <ESC>  " jjでエスケープ

"  全角スペースをハイライト表示
function! FullSpace()
  highlight FullSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup FullSpace
  autocmd!
  autocmd ColorScheme       * call FullSpace()
  autocmd VimEnter,WinEnter * match FullSpace /　/
  augroup END
  call FullSpace()
endif


"--------------------------------------
" APPEARANCE Setting
"--------------------------------------
"colorscheme molokai     "  ~/.vim/colors/molokai.vim
set number          "  行番号を表示
syntax enable       "  シンタックスハイライトの有効化
syntax on           "  SyntaxをEnable
set cursorline      "  現在の行を強調表示
set cursorcolumn    "  現在の行を強調表示（縦）
set smartindent     "  インデントはスマートインデント
set visualbell      "  ビープ音を可視化
set showmatch       "  括弧入力時の対応する括弧を表示
set laststatus=2    "  ステータスラインを常に表示
set wildmode=list:longest   "  コマンドラインの補完
set virtualedit=onemore     "  行末の1文字先までカーソルを移動できるように
"  折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"  カーソルタイプ指定
if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

"--------------------------------------
" PLUGIN Setting
"--------------------------------------
"
"https://github.com/junegunn/vim-plug
" vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

  "  nerdtree
  "  https://github.com/preservim/nerdtree
  "Plug 'preservim/nerdtree'

  "  https://github.com/junegunn/fzf.vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

call plug#end()

"
" NERDTree
"
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
