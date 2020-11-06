"" -------------------------------
"" Vundle.vim
"" -------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 導入したいプラグインを以下に列挙 Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-endwise'
Plugin 'Shougo/neocomplcache'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'nanotech/jellybeans.vim'
Plugin 'miyakogi/seiya.vim'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-fugitive'
 
call vundle#end()
"filetype plugin indent on
"--- Vundle.vim ここまで

"" --------------------------------
"" 基本設定
"" --------------------------------
"set clipboard=unnamed,autoselect
vnoremap <C-y> "+y
set colorcolumn=80

"colorscheme default
set shell=/bin/zsh
set encoding=utf-8
set number

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

syntax enable  " ハイライトを有効化する
set hlsearch   " 検索マッチをハイライト
set showmatch  " 対応するカッコのハイライト
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab
set autoindent
set laststatus=2
set tabstop=2 shiftwidth=2 expandtab
set cursorline
set cursorcolumn

""----------------------------------------
"" color
""----------------------------------------
colorscheme jellybeans
let g:seiya_auto_enable=1

""----------------------------------------
"" vim-indent-guides
""----------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

""----------------------------------------
"" NERDtree(ファイラー)
""----------------------------------------
nnoremap <silent><C-t> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

""----------------------------------------
"" neocomplcache(自動補完)
""----------------------------------------
" 起動時に有効
let g:acp_enableAtStartup = 0
" 自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_enable_at_startup = 2
" 手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
" 補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
" 大文字小文字を区切りとしたあいまい検索を行うかどうか。
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバーを区切りとしたあいまい検索を行うかどうか。
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 3

""----------------------------------------
"" itchyny/lightline.vim(下部のステータスバー)
""----------------------------------------
"" ノーマルで使用中

""----------------------------------------
"" プラグイン指定のファイルタイプの有効化
""----------------------------------------
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.md   setlocal filetype=md
autocmd BufNewFile,BufRead *.html setlocal filetype=htmldjango

""----------------------------------------
"" ファイルタイプごとの設定
""----------------------------------------
" Indent width
if has("autocmd")
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType slim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
  autocmd FileType bash        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yml         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType mkd         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType md          setlocal sw=2 sts=2 ts=2 et
endif

""----------------------------------------
"" scrooloose/syntastic(シンタックスチェック)
""----------------------------------------
let g:syntastic_python_checkers = ["flake8"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""----------------------------------------
"" tpope/vim-markdown(マークダウン関連)
""----------------------------------------
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1
