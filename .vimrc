" 行番号の表示
set nu

" 自動インデント
set autoindent

" タブ入力時に半角スペースに変換
set expandtab

" タブ幅を4で表示
set tabstop=4

" 自動インデントで使用される空白数
set shiftwidth=4
" set softtabstop=4

filetype plugin indent on

" html系ファイルのインデント設定
autocmd FileType html,smarty setlocal tabstop=2
autocmd FileType html,smarty setlocal shiftwidth=2
autocmd FileType html,smarty setlocal softtabstop=2

" Gauche用
autocmd FileType scheme :let is_gauche=1

" 閉じ括弧入力時に対応する括弧の強調
set showmatch

" showmatch設定の表示秒数(0.1秒単位)
set matchtime=3

" インクリメンタルサーチ(検索文字入力中から検索)
set incsearch

" 検索結果のハイライト表示
set hlsearch

" 検索で大文字小文字を区別しない
set ignorecase

" 検索文字に大文字が含まれる場合にignorecaseをOFFにする(大文字小文字を区別する)
set smartcase

" ファイルの末尾まで検索した後に先頭から繰り返さない(逆方向も)
set nowrapscan

" コマンドラインにおける補完候補の表示
set wildmenu

" Deleteキーの有効化
set t_kD=

" カラー設定
colorscheme torte

" 見た目によるカーソル移動(上下)
nnoremap j gj
nnoremap k gk

" 検索結果行の中央表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

" 挿入モードでのエスケープ
imap <C-u> <esc>

" 挿入モードでのカーソル移動
imap <C-j> <Down>
imap <C-k> <Up>
" imap <C-h> <Left> " バックスペースとバッティングする
imap <C-l> <Right>

" カーソル下のファイルを別ウィンドウでオープン
nmap ff <C-w>f

syntax enable

" Backspace有効化
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

set backspace=indent,eol,start

" 自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" PHPファイルの書き込み時にシンタックスエラーチェック
autocmd BufWritePost *.php :call PHPLint()

function PHPLint()
    let result = system(&ft . ' -l ' . bufname(""))
    let headPart = strpart(result, 0, 16)

    if headPart != "No syntax errors"
        echo result
    endif
endfunction

