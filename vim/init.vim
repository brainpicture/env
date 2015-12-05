"nvim specific
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"runtime macros/matchit.vim
set nocompatible
set autoindent
set smartindent

"set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showmatch
set ruler
set nohls
set incsearch

syntax on

set mouse=a

set virtualedit=all

set number

set ignorecase

set smartcase

set incsearch

set hlsearch

set nobackup
set nowritebackup
set noswapfile
"set backup

set backupdir=/tmp
set backupskip=~/.vim/tmp/*
set directory=~/.vim/tmp
set writebackup
set dictionary=~/.vim/tmp/dict

"set directory=/tmp

set complete=.,w,b,k
set completeopt=menu
"let g:SuperTabDefaultCompletionType="<c-x><c-p>"
"let g:SuperTabDefaultCompletionType="context"
let g:SuperTabNoCompleteAfter=["[^a-zA-Z]"]
let g:SuperTabLongestEnhanced=1

set autoread

filetype on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType make setlocal noexpandtab
autocmd FileChangedShell * echo "Warning: File changed on disk"

let php_sql_query=1
"let php_htmlInStrings=1
set matchpairs+=<:>

set wildmode=full

set wildmenu

set t_Co=256

colorscheme lucius
"set background=light
"colorscheme bclear

"------------

set termencoding=utf8
set fileencodings=cp1251,utf-8,koi8-r,latin1

set iskeyword+=$

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
au Bufread,BufNewFile *.as set filetype=actionscript
autocmd BufWinLeave * :let g:LastBuff=expand('<abuf>') " // restore last closed buf
autocmd BufWritePost *.snippets :call ReloadAllSnippets()

noremap ,T :execute 'tabnew +'.g:LastBuff.'buf'<CR>

noremap  <f2> :w<return>
inoremap <f2> <Esc>:w<return>
inoremap <S-f2> <Esc>:w<return>
noremap  ,w :w<return>

noremap  ,b :w<CR>:!./build.sh<CR>

nnoremap <C-Up> mx:m-2<CR>`x==
nnoremap <C-Down> mx:m+<CR>`x==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <C-Up> :m'<-2<CR>`>my`<mzgv`yo`z

set hidden

noremap  <f8> :BufExplorer<return>
inoremap <f8> <c-o>:BufExplorer<return>
vnoremap <f8> <c-o>:BufExplorer<return>

map <f3> <f2>
imap <f3> <f2>

map <f1> <f2>
imap <f1> <f2>

nnoremap <Home> ^
inoremap <Home> <Esc>^i
vnoremap <Home> <Esc>^v

"inoremap {<Enter> {<Enter>}<Esc>ko
let g:AutoPairsMapCR=0
inoremap {<Enter> {<Enter><End><Enter>}<Esc>ki<End>

inoremap <C-]> <Esc>l<C-]>
inoremap <C-S-Left> <Esc>v<C-Left>
inoremap <C-S-Right> <Esc>v<C-Right>
inoremap <C-S-Up> <Esc>v<C-Up>
inoremap <C-S-Down> <Esc>v<C-Down>
vnoremap <C-S-Up> <Up>
vnoremap <C-S-Down> <Down>
nnoremap <C-S-Up> v<Up>
nnoremap <C-S-Down> v<Down>
nnoremap <C-S-Left> v<C-Left>
nnoremap <C-S-Right> v<C-Right>

" Layout problem
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

" backspace in Visual mode deletes selection
vnoremap <BS> d
noremap <BS> i<BS>
noremap <Del> xi

noremap <CR> o

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   "+gP
map <S-Insert>    "+gP

cmap <C-V>    <C-R>+
cmap <S-Insert>   <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>   <C-V>
vmap <S-Insert>   <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   <C-V>

" CTRL-Tab is Next window
noremap <C-Tab> gt
noremap <C-S-Tab> gT
vnoremap <C-Tab> <Esc>gt
vnoremap <C-S-Tab> <Esc>gT
inoremap <C-Tab> <C-o>:tabn<CR>
inoremap <C-S-Tab> <C-o>:tabp<CR>
noremap ,. gt
noremap ,m gT
noremap ,, gT
noremap <D-M-Left> gT
noremap <D-M-Right> gt
vnoremap <D-M-Left> <Esc>gT
vnoremap <D-M-Right> <Esc>gt
inoremap <D-M-Left> <C-o>:tabp<CR>
inoremap <D-M-Right> <C-o>:tabn<CR>
let g:SuperTabMappingTabLiteral = '<c-d-tab>'

for _i in range(1, 9)
  exe "noremap <D-"._i."> "._i."gt"
  exe "inoremap <D-"._i."> <Esc>"._i."gt"
  exe "vnoremap <D-"._i."> <Esc>"._i."gt"
  exe "cnoremap <D-"._i."> <Esc>"._i."gt"
  exe "noremap ,"._i." :tabn "._i."<CR>"
endfor

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj
"inoremap <silent> <Up> <C-o>gk
"inoremap <silent> <Down> <C-o>gj
"inoremap <Up> <Esc>gka
"inoremap <Down> <Esc>gja
nmap <silent> ,/ :nohlsearch<CR>
set scrolloff=1
set shortmess=atIstTA
set viminfo='100,<50,:100,/50,s10,h,f50,!

set guioptions=gi

if has("mac")
  let g:fontsize=12
  let g:fontpref="Monaco:h"
  "let g:fontpref="Source Code Pro:h"
  "set guioptions+=e
else
  let g:fontsize=10
  let g:fontpref="Monospace "
endif
let &guifont=g:fontpref.g:fontsize
nmap ,= :let g:fontsize+=1<CR>:let &guifont=g:fontpref.g:fontsize<CR>
nmap ,- :let g:fontsize-=1<CR>:let &guifont=g:fontpref.g:fontsize<CR>
nmap ,+ :let g:fontsize=11<CR>:let &guifont=g:fontpref.g:fontsize<CR>

nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>

let g:qname_filter = '| grep ".\(php\|js\|css\|html\)$"'

let g:AutoPairs = {'(':')', '[':']', "'":"'",'"':'"', '`':'`'}

map <F8> <Plug>ShowFunc

nmap ,s :source $MYVIMRC<CR>
nmap ,sp :tabnew ~/.vim/snippets/php.snippets<CR>
nmap ,sj :tabnew ~/.vim/snippets/javascript.snippets<CR>
nmap ,sc :tabnew ~/.vim/snippets/css.snippets<CR>
nmap ,sh :tabnew ~/.vim/snippets/html.snippets<CR>
nmap ,s_ :tabnew ~/.vim/snippets/_.snippets<CR>
nmap ,v :tabnew $MYVIMRC<CR>

nmap ,n :tabnew ~/.vim/tasks.md<CR>

nmap gp :call JumpToParams()<CR>i
nmap gl :call JumpToFunction()<CR>
nmap gk :call JumpToGlobal()<CR>
nmap gL :call JumpToFunctionDown()<CR>
noremap ,m :call ToggleMouse()<CR>
map ,g :GundoToggle<CR>
nmap ,q :q<CR>
nmap ,t :tabnew<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap ,iw viw"xyodebugServerLog('<Esc>"xpli', <Esc>"xpli);<Esc>
nmap ,i( vi("xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ,i) vi)"xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ,i' vi'"xyodebugServerLog('<Esc>"xpli', <Esc>"xpli);<Esc>
nmap ,i" vi""xyodebugServerLog('<Esc>"xpli', <Esc>"xpli);<Esc>
nmap ,aw vaw"xyodebugServerLog('<Esc>"xpli', <Esc>"xpli);<Esc>
nmap ,a( va("xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ,a) va)"xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ,a' va'"xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ,a" va""xyodebugServerLog(<Esc>"xpli);<Esc>
nmap ;o A;<Esc>o
nmap ;O A;<Esc>O
nmap ;; A;<Esc>
nmap ,df diwds(
nmap ,o4 :tabnew ./www/49.php<CR>
nmap ,tcj :tabnew ./static/js/al/common.js<CR>
nmap ,tco :tabnew ./www/config.php<CR>
nnoremap ,y viwy
"nnoremap ,pr i'+(window.devicePixelRatio >= 2 ? '_2x' : '')+'<Esc>
"nmap ,pd a<C-R>=strftime("%b %d, %Y")<CR>
nnoremap ,p viwp

nmap ;iw yiw`xP<Esc>

nmap ,k mxO<Esc>VC#ifndef KittenPHP<Esc>jo<Esc>VC#endif<Esc>

"nnoremap <C-\> <C-w><C-]><C-w>T
nnoremap ,] <C-]>
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
noremap ,\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <D-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <D-]> :tabnext<CR>
inoremap <D-]> <Esc>:tabnext<CR>
cnoremap <D-]> <Esc>:tabnext<CR>
noremap <D-[> :tabprev<CR>
inoremap <D-[> <Esc>:tabprev<CR>
cnoremap <D-[> <Esc>:tabprev<CR>

let g:tcommentMaps = 0
noremap <D-/> :TComment<CR>
inoremap <D-/> <c-o>:TComment<CR>
vnoremap <D-/> :TCommentMaybeInline<CR>

command! Q q
command! FormatXML 1,$!xmllint --format --recover - 2>/dev/null "format xml file
command! CleanCSS call CleanCSS

set noerrorbells visualbell t_vb=

function! JumpToParams()
  normal! mx
  call search("function\.*(\.*)", 'be')
endfunction

function! JumpToFunction()
  normal! mx
  call search("function\\s*\.", 'be')
endfunction

function! JumpToGlobal()
  call JumpToFunction()
  +1
  let str = getline(".")
  "echo str
  if match(str, "global") != -1
    call feedkeys("$i")
  else
    call feedkeys("Oglobal ;\<Esc>i")
  endif
endfunction

function! JumpToFunctionDown()
  normal! mx
  call search("function\.*(\.*)", 'be')
endfunction

function! ToggleMouse()
    if !exists("old_mouse")
        let old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

function! BuildDict()
  silent !grep -o '^[a-zA-Z][a-zA-Z_0-9\-]\+' ./tags | uniq > ~/.vim/tmp/dict
  redraw!
  echo 'Dictionary updated'
endfunction
command! BuildDict call BuildDict()

function! CleanCSS()
  %s/;\}/\}/g
  %s/[;\{]/\0\r/g
  %s/\}/\r\0/g
  gg=G
endfunction

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

set ttimeoutlen=0

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


ab apdding padding
ab amrgin margin
ab esle else

nmap ,<F4> :cd ~/<CR>:cd ./Mount/Data<CR><F4>
nmap б<F4> :cd ~/<CR>:cd ./Mount/Data<CR><F4>
let g:session = 0

function! SwitchToSession(session)
  if (g:session)
    exec "mks ~/.vim/tmp/".g:session.".session"
    try
      exec "so ~/.vim/tmp/".a:session.".session"
    catch
      exec "mks! ~/.vim/tmp/".a:session.".session"
      let g:session = a:session
    endtry
  else
    let g:session = a:session
    exec "mks! ~/.vim/tmp/".a:session.".session"
  endif
endfunction

" Sessions
" noremap ,1 :call SwitchToSession(1)<CR>
" noremap ,2 :call SwitchToSession(2)<CR>


" Spaces
noremap <space> :call Spaces()<CR>
if !exists("g:spaces")
  let g:spaces = {}
endif
let g:spacesPrev = [-1, ""]
function! Spaces()
  let outstr = ""
  for [key, value] in items(g:spaces)
    let outstr = outstr."[".value[2]."] ".value[1]." "
  endfor
  echo outstr
  let c = getchar()
  if !type(c)
    let c = nr2char(c)
  endif
  if (c == "\<Esc>")
    redraw
    echo ""
    return
  elseif (c == "\<Space>")
    let num = g:spacesPrev
  elseif (match(c, '[A-Z]\C') != -1)
    let c = substitute(c, ".*", "\\L\\0", "")
    let num = [-1]
  elseif (match(c, '[a-z0-9]\C') != -1)
    let num = get(g:spaces, c, [-1])
  else
    return
  endif
  if (num[0] != -1)
    let g:spacesPrev = [bufnr("%")]
    redraw
    exe ":buffer ".num[0]
  else
    let spaceName = matchstr(bufname("%"), "[^/]*$")
    let spaceLetter = substitute(c, ".*", "\\U\\0", "")
    let g:spaces[c] = [bufnr("%"), spaceName, spaceLetter]
    redraw
    echo "added [".spaceLetter."] ".spaceName
  endif
endfunction

