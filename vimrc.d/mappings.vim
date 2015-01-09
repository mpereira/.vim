" ; <-> :.
nnoremap ; :
nnoremap : ;

" Toggle paste mode.
nnoremap <leader>tp :set invpaste paste?<cr>

" Don't show the help screen on <F1>.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use regular regular expressions.
nnoremap / /\v
vnoremap / /\v

" Yank from cursor to EOL.
nnoremap Y y$

" I rarely need to look at man pages from vim and accidentally hit this key
" too often.
nnoremap K <nop>

" Quick alternate buffer.
nnoremap <leader>, <c-^>

" Clear search highlighting.
nnoremap <silent> <leader>cl :nohlsearch<cr>

" Help.
nnoremap <leader>he :help<Space>

" Remove trailing whitespaces without overwriting the last search pattern.
nnoremap <silent> <leader>tr :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<cr>

" Retab.
nnoremap <leader>rt :retab<cr>

" Open vsplit and switch over to it.
nnoremap <leader>vs <c-w>v<c-w>l

" Open hsplit and switch over to it.
nnoremap <leader>hs <c-w>s<c-w>j

" Tabs.
nnoremap <silent> <leader>( :tabprev<cr>
nnoremap <silent> <leader>) :tabnext<cr>

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

" Quickly save.
nnoremap <leader>w :w<CR>

" Quickly quit.
nnoremap <leader>q :q<CR>

" Swap words to left and right.
nnoremap <silent> <e "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>:nohls<cr>
nnoremap <silent> >e "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR>:nohls<cr>
