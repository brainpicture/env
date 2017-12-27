"nvim specific
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap <C-k> <C-\><C-n><C-w>k
  nnoremap <F1> :call TerminalBuf()<CR>
  inoremap <F1> <Esc>:call TerminalBuf()<CR>
  vnoremap <F1> <Esc>:call TerminalBuf()<CR>
  cnoremap <F1> <Esc>:call TerminalBuf()<CR>

  let g:termBuf = -1
  let g:prevBuf = -1
  function! TerminalBuf()
    if g:termBuf == -1 || bufexists(g:termBuf) == 0
      let g:prevBuf = bufnr("%")
      exec ":e term://bash"
      exec ":file terminal"
      let g:termBuf = bufnr("%")
      tnoremap <buffer> <silent> <F1> <C-\><C-n>:call TerminalPrev()<CR>
      nnoremap <buffer> <silent> <F1> :call TerminalPrev()<CR>
      autocmd BufEnter <buffer> normal i
    else
      let g:prevBuf = bufnr("%")
      exe ":buffer ".g:termBuf
    endif
    exec "normal! i"
  endfunction

  function! TerminalPrev()
    exe ":buffer ".g:prevBuf
  endfunction
endif

execute pathogen#infect()
filetype plugin on
map <Leader> <Plug>(easymotion-prefix)

" xdebug
if exists('$XDEBUG_PORT')
  let g:dbgPavimPort = $XDEBUG_PORT
endif
let g:dbgPavimSessionAutostart = 1
let g:dbgPavimAutostart = 1
let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimKeyToggleBp = '<F5>'
let g:dbgPavimKeyRun = ''
let g:dbgPavimKeyQuit = ''
let g:dbgPavimKeyLeave = '<Esc><Esc>'
let g:dbgPavimKeyToggleBae = ''
let g:dbgPavimOnce = 1


set laststatus=0

set nocompatible
set autoindent
set smartindent
set novisualbell

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
autocmd FileType php setlocal commentstring=//\ %s

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
"set fileencodings=cp1251,utf-8,koi8-r,latin1
set fileencodings=utf-8,koi8-r,latin1

set iskeyword+=$

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
au Bufread,BufNewFile *.as set filetype=actionscript
autocmd BufWinLeave * :let g:LastBuff=expand('<abuf>') " // restore last closed buf
autocmd BufWritePost *.snippets :call ReloadAllSnippets()

set number
"set relativenumber
"autocmd FocusLost * :set norelativenumber number
"autocmd FocusGained * :set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber

nnoremap ,T :execute 'tabnew +'.g:LastBuff.'buf'<CR>

noremap  <f2> :w<return>
inoremap <f2> <Esc>:w<return>
inoremap <S-f2> <Esc>:w<return>
nnoremap  ,w :w<return>
nnoremap  ,b :w<CR>:!./build.sh<CR>

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

set pastetoggle=<F5>
" Auto :paste node when C-V used
"function! XTermPasteBegin()
"  set pastetoggle=<Esc>[201~
"  set paste
"  return \""
"endfunction
"if exists('$TMUX')
"  &t_SI .= \"\<Esc>Ptmux;\<Esc>\<Esc>[?2004h\<Esc>\\"
"  let &t_EI .= \"\<Esc>Ptmux;\<Esc>\<Esc>[?2004l\<Esc>\\"
"else
"  let &t_SI .= \"\<Esc>[?2004h"
"  let &t_EI .= \"\<Esc>[?2004l"
"  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"endif

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   <C-V>

"noremap <Down> <c-e>j
"noremap <Up> <c->k
noremap <S-Down> j
noremap <S-Up> k

" CTRL-Tab is Next window
noremap <C-Tab> gt
noremap <C-S-Tab> gT
vnoremap <C-Tab> <Esc>gt
vnoremap <C-S-Tab> <Esc>gT
inoremap <C-Tab> <Esc>gt
inoremap <C-S-Tab> <Esc>gT
nnoremap ,. gt
nnoremap ,, gT

nnoremap ,l gt
nnoremap ,h gT
for _i in range(1, 9)
  exe "nnoremap <D-"._i."> "._i."gt"
  exe "inoremap <D-"._i."> <Esc>"._i."gt"
  exe "vnoremap <D-"._i."> <Esc>"._i."gt"
  exe "cnoremap <D-"._i."> <Esc>"._i."gt"
  exe "nnoremap ,"._i." :tabn "._i."<CR>"
endfor

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <Up> gk
nnoremap <Down> gj
"inoremap <silent> <Up> <C-o>gk
"inoremap <silent> <Down> <C-o>gj
"inoremap <Up> <Esc>gka
"inoremap <Down> <Esc>gja
nnoremap <silent> ,/ :nohlsearch<CR>
set scrolloff=1
set shortmess=atIstTA
set viminfo='100,<50,:100,/50,s10,h,f50,!

set guioptions=gi

if has("mac")
  let g:fontsize=15
  let g:fontpref="Monaco:h"
  "set guioptions+=e
else
  let g:fontsize=10
  let g:fontpref="Monospace "
endif
let &guifont=g:fontpref.g:fontsize
nnoremap ,= :let g:fontsize+=1<CR>:let &guifont=g:fontpref.g:fontsize<CR>
nnoremap ,- :let g:fontsize-=1<CR>:let &guifont=g:fontpref.g:fontsize<CR>
nnoremap ,+ :let g:fontsize=11<CR>:let &guifont=g:fontpref.g:fontsize<CR>

nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>

let g:AutoPairs = {'(':')', '[':']', "'":"'",'"':'"', '`':'`'}

map <F8> <Plug>ShowFunc

nnoremap ,s :source $MYVIMRC<CR>
nnoremap ,sp :tabnew ~/.vim/snippets/php.snippets<CR>
nnoremap ,sj :tabnew ~/.vim/snippets/javascript.snippets<CR>
nnoremap ,sc :tabnew ~/.vim/snippets/css.snippets<CR>
nnoremap ,sh :tabnew ~/.vim/snippets/html.snippets<CR>
nnoremap ,s_ :tabnew ~/.vim/snippets/_.snippets<CR>
nnoremap ,v :tabnew $MYVIMRC<CR>

nnoremap ,n :tabnew ~/.vim/tasks.md<CR>
nnoremap ,pd a<C-R>=strftime("%b %d, %Y")<CR>

nnoremap ,rc :%s/\<<C-r><C-w>\>/
vnoremap ,rc y:%s/<C-r>"/
nnoremap ,cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap ,cc y:%s/<C-r>"/<C-r>"
nnoremap <silent> ,a :ArgWrap<CR>
nnoremap ,o yiwo<Esc>lpbi
nnoremap yo yiwo

nmap gp :call JumpToParams()<CR>i
nmap gl :call JumpToFunction()<CR>
nmap gk :call JumpToGlobal()<CR>
nmap gL :call JumpToFunctionDown()<CR>
nnoremap ,m :call ToggleMouse()<CR>
nnoremap ,g :GundoToggle<CR>
nnoremap ,q :q<CR>
nnoremap ,t :tabnew<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <D-j> <C-e>j
nnoremap <D-k> <C-y>k
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nmap ;o A;<Esc>o
nmap ;O A;<Esc>O
nmap ;; A;<Esc>
nnoremap ,df diwds(
nnoremap ,\ ^i//<Esc>
vnoremap ,d "xyodebugServerLog(<Esc>"xpli);<Esc>
"nnoremap ,pr i'+(window.devicePixelRatio >= 2 ? '_2x' : '')+'<Esc>

" BookmarkPut
vnoremap <silent> m y:call BookmarkPut()<CR>
function! BookmarkPut()
  echo "bookmark: "
  let c = getchar()
  if !type(c)
    let c = nr2char(c)
  endif
  if (match(c, '[a-zA-Z0-9]\C') != -1)
    exec "normal! `".c."P"
  elseif
    echo "should be a leter"
  endif
endfunction


nnoremap ,k mxO<Esc>VC#ifndef KittenPHP<Esc>jo<Esc>VC#endif<Esc>

vnoremap v iw

nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <D-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <D-]> :tabnext<CR>
inoremap <D-]> <Esc>:tabnext<CR>
cnoremap <D-]> <Esc>:tabnext<CR>
nnoremap <D-[> :tabprev<CR>
inoremap <D-[> <Esc>:tabprev<CR>
cnoremap <D-[> <Esc>:tabprev<CR>

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

ab apdding padding
ab amrgin margin
ab esle else

nnoremap ,<F4> :cd ~/<CR>:cd ./Mount/Data<CR><F4>
let g:qname_base_hotkey = "<C-F4>"
let g:qname_filter = '| grep ".\(php\|js\|css\|html\)$"'
let g:ctrlp_map = '<F4>'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<tab>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>', '<F4>'],
    \ }

let g:go_fmt_autosave = 0

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

" Spaces
noremap <space> :call Spaces()<CR>
if !exists("g:spaces")
  let g:spaces = {}
endif
let g:spacesPrev = [-1, ""]
function! Spaces()
  let outstr = "Enter mark to go: "
  "for [key, value] in items(g:spaces)
  "  let outstr = outstr."[".value[2]."] ".value[1]." "
  "endfor
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
    if (g:spacesPrev[0] == -1)
      let num = [bufnr("%")]
    else
      let num = g:spacesPrev
    endif
  elseif (match(c, '[A-Z]\C') != -1)
    let c = substitute(c, ".*", "\\L\\0", "")
    let num = [-1]
  elseif (match(c, '[a-z0-9]\C') != -1)
    let num = get(g:spaces, c, [-1])
  else
    return
  endif
  if (num[0] == -1)
    let spaceName = matchstr(bufname("%"), "[^/]*$")
    let spaceLetter = substitute(c, ".*", "\\U\\0", "")
    let g:spaces[c] = [bufnr("%"), spaceName, spaceLetter]
    redraw
    echo "added [".spaceLetter."] ".spaceName
  else
    let g:spacesPrev = [bufnr("%")]
    redraw
    exe ":buffer ".num[0]
  endif
endfunction
