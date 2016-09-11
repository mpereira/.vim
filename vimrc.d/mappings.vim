" ; <-> :.
nnoremap ; :
nnoremap : ;

" Toggle paste mode.
nnoremap <localleader>tp :set invpaste paste?<cr>

" Don't show the help screen on <F1>.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use regular regular expressions.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Yank from cursor to EOL.
nnoremap Y y$

" I rarely need to look at man pages from vim and accidentally hit this key
" too often.
nnoremap K <nop>

" Quick alternate buffer.
nnoremap <localleader>, <c-^>

" Clear search highlighting.
nnoremap <silent> <localleader>cl :nohlsearch<cr>

" Help.
nnoremap <localleader>he :help<Space>

" Remove trailing whitespaces without overwriting the last search pattern.
nnoremap <silent> <localleader>tr :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<cr>

" Retab.
nnoremap <localleader>rt :retab<cr>

" Open vsplit and switch over to it.
nnoremap <localleader>vs <c-w>v<c-w>l

" Open hsplit and switch over to it.
nnoremap <localleader>hs <c-w>s<c-w>j

" Tabs.
nnoremap <silent> <localleader>( :tabprev<cr>
nnoremap <silent> <localleader>) :tabnext<cr>

" Don't move on *
" I'd use a function for this but Vim clobbers the last search when you're in
" a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Quickly move between splits.
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Quickly save.
nnoremap <localleader>w :w<cr>

" Quickly quit.
nnoremap <localleader>q :q<cr>

" Swap words to left and right.
nnoremap <silent> <e "_yiw?\w\+\_W\+\%#<cr>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o>:nohls<cr>
nnoremap <silent> >e "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o>/\w\+\_W\+<cr>:nohls<cr>

" Toggle spell-checking.
nnoremap <silent> <localleader>sp :set spell!<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>

" Close preview, quickfix and DBExt windows.
noremap <unique> <silent> <localleader>pc <c-w>z:ccl<cr>:DBResultsClose<cr>

" Plugin: vim-split-join
noremap <localleader>J :SplitjoinJoin<cr>
noremap <localleader>S :SplitjoinSplit<cr>

" Plugin: vim-slamhound
autocmd FileType clojure nnoremap <buffer> <localleader>ns :Slamhound<cr>

" Plugin: bufexplorer
" nnoremap <script> <silent> <unique> <localleader>be :BufExplorer<cr>

" Plugin: NrrwRgn
" xmap <unique> <localleader>nr <Plug>NrrwrgnDo
" nmap <unique> <localleader>nr <Plug>NrrwrgnDo
" xmap <unique> <localleader>Nr <Plug>NrrwrgnBangDo

" Plugin: vim-speeddating
nmap + <Plug>SpeedDatingUp
nmap - <Plug>SpeedDatingDown
xmap + <Plug>SpeedDatingUp
xmap - <Plug>SpeedDatingDown

" Plugin: vim-fireplace
au FileType clojure nnoremap <buffer> <localleader>er :silent! Require<cr>:Last!<cr>
au FileType clojure nnoremap <buffer> <localleader>eR :silent! Require!<cr>:Last!<cr>
au FileType clojure nnoremap <buffer> <localleader>ee :silent! %Eval<cr>:Last!<cr>
au FileType clojure nnoremap <buffer> <localleader>ef :silent! Eval<cr>:Last!<cr>

" Plugin: vim-pipe
" nnoremap <localleader>ee -> evals SQL script.
" nnoremap <localleader>pc -> closes SQL output buffer.

" Plugin: Superior-Haskell-Interaction-Mode-SHIM
autocmd FileType haskell vnoremap <buffer> <localleader>ee :GhciRange<cr>
autocmd FileType haskell nnoremap <buffer> <localleader>ee :GhciFile<cr>
autocmd FileType haskell nnoremap <buffer> <localleader>er :GhciReload<cr>
autocmd FileType haskell nnoremap <buffer> K :HoogleInfo<cr>
