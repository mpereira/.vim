set nocompatible        " disable vi compatibility

set encoding=utf-8
set fileencoding=utf-8

set ignorecase          " makes search case-insensitive
set smartcase           " unless it contains uppercase characters
set incsearch           " show pattern while typing
set hlsearch            " highlight search results

set tabstop=2           " tab width is 2 spaces
set softtabstop=2       " counts 2 spaces when delete or backspace is used
set shiftwidth=2        " indent with 2 spaces
set expandtab           " expand tabs to spaces

set smartindent         " use intelligent identention
set autoindent          " use identention of previous line

set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

set number              " show line numbers
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set showmatch           " highlight matching braces
set wrap                " wrap lines automatically
set autochdir           " automatically cd into the directory the file is
set ttyfast             " tell vim that our terminal is fast
set novisualbell        " don't blink
set noerrorbells        " no noise
set scrolloff=3         " minimal number of lines above and below the cursor
set directory=~/tmp     " swap files location
set autowrite           " flush external changes on open files
set laststatus=2        " show status line

" display a warning if fileformat isn't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" display a warning if &et is wrong, we have mixed-indenting or long lines
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineLongLineWarning()}

" display a warning if we have syntax errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%h      " help file flag
set statusline+=%y      " filetype
set statusline+=%r      " read only flag
set statusline+=%m      " modified flag

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set wildmode=list:longest   " cmdline tab completion
set wildmenu                " enable c-n and c-p to scroll through matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing

" comprehensive saving and quiting
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" enable filetype detection
filetype on
filetype plugin on
filetype plugin indent on

" display tabs and trailing spaces
set list
set listchars=tab:»⋅,trail:⋅,nbsp:⋅

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" line highlighting
set cursorline

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" tell the term has 256 colors
set t_Co=256

" syntax highlighting
syntax on

" display settings
set lines=45
set columns=84

" GUI options
if has("gui_running")
  colorscheme vividchalk
  set guifont=Monaco\ 9
  set guioptions-=T          " no toolbar
  set guioptions-=m          " no menu
  set guioptions-=r          " no right side scrollbar
  set guioptions-=L          " no left side scrollbar
  set guioptions+=c          " console messages rather than GUI dialogs
  set guicursor+=a:blinkon0  " no cursor blinking
  set mousehide              " hide mouse when start typing
else
  colorscheme candycode
endif

" commands overview
" F1     - Vim help
" F2     - FuzzyFinder
" F4     - remove trailing whitespaces
" F5     - Toggle paste mode
" F8     - Copy selection to clipboard
" F11    - Toggle NERD tree
" <S-F8> - paste contents from the X server register
" <C-L>  - redraws the screen

" filetypes
autocmd BufRead,BufNewFile Rakefile   set filetype=ruby
autocmd BufRead,BufNewFile rakefile   set filetype=ruby
autocmd BufRead,BufNewFile *.rake     set filetype=ruby
autocmd BufRead,BufNewFile .irbrc     set filetype=ruby
autocmd BufRead,BufNewFile *.rjs      set filetype=ruby
autocmd BufRead,BufNewFile *.rhtml    set filetype=eruby
autocmd BufRead,BufNewFile *.html.erb set filetype=eruby

" omni completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags

" aliases
iab msp Murilo Soares Pereira
iab @@ murilo.soares3@gmail.com

" vim-ruby options
compiler ruby                " enable compiler support for ruby
let g:rubycomplete_rails = 1 " load rails environment for rails project's files

" FuzzyFinder
map <F2> :FufFile<CR>

" NERDTree
map <F11> :NERDTreeToggle<CR>

" syntastic options
let g:syntastic_enable_signs=1   " points error lines with arrows
let g:syntastic_auto_loc_list=1  " open the error buffer automatically

" keeping history data
set viminfo='10,\"30,:20,%,n~/.viminfo
" cursor at the same position as it were on last edit
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" make <c-l> clear the highlights as well as redraw the screen
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" removes all trailing whitespaces from the file
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" toggles paste mode
nmap <F5> :call TogglePasteMode()<cr>
imap <F5> <c-o><F5>

" copy line to X server register
vmap <F8> :!xclip -f -sel clip<CR>

" paste contents from the X server register
map <S-F8> mz:-1r !xclip -o -sel clip<CR>`z

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

function TogglePasteMode ()
  if (&paste)
    set nopaste
    echo
  else
    set paste
    echo
  endif
endfunction

" define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
  \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
  \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
  \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
  \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
  \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
  \ proident, sunt in culpa qui officia deserunt mollit anim id est
  \ laborum.

" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" return '[\s]' if trailing white space is detected
" return an empty string if everything is fine
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction


" recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" return a warning for "long lines" where "long" is either &textwidth or 80 (if
" no &textwidth is set)
"
" return [#x,my,$z] if long lines are found, were x is the number of long
" lines, y is the median length of the long lines and z is the length of the
" longest line
" return an empty string if everything is fine
function! StatuslineLongLineWarning()
  if !exists("b:statusline_long_line_warning")
    let long_line_lens = s:LongLines()

    if len(long_line_lens) > 0
      let b:statusline_long_line_warning = "[" .
        \ '#' . len(long_line_lens) . "," .
        \ 'm' . s:Median(long_line_lens) . "," .
        \ '$' . max(long_line_lens) . "]"
    else
      let b:statusline_long_line_warning = ""
    endif
  endif
  return b:statusline_long_line_warning
endfunction

" return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
  let threshold = (&tw ? &tw : 80)
  let spaces = repeat(" ", &ts)

  let long_line_lens = []

  let i = 1
  while i <= line("$")
    let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
    if len > threshold
      call add(long_line_lens, len)
    endif
    let i += 1
  endwhile

  return long_line_lens
endfunction

" find the median of the given array of numbers
function! s:Median(nums)
  let nums = sort(a:nums)
  let l = len(nums)

  if l % 2 == 1
    let i = (l-1) / 2
    return nums[i]
  else
    return (nums[l/2] + nums[(l/2)-1]) / 2
  endif
endfunction
