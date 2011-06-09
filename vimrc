" load pathogen
filetype off
call pathogen#runtime_append_all_bundles()

" enable filetype detection
filetype plugin on
filetype plugin indent on

set nocompatible        " disable vi compatibility

set modelines=0         " disable modelines (prevents a security exploit)

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

set clipboard=unnamed   " yanked values piped to the clipboard
set number              " show line numbers
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set showmatch           " highlight matching braces
set wrap                " wrap lines automatically
set ttyfast             " tell vim that our terminal is fast
set novisualbell        " don't blink
set noerrorbells        " no noise
set cursorline          " highlights the line where the cursor is at
set scrolloff=3         " minimal number of lines above and below the cursor
set directory=~/.tmp    " swap files location
set autowrite           " flush external changes on open files
set laststatus=2        " show status line
set hidden              " don't lose undo history when changing buffers
set lazyredraw          " do not redraw while running macros

" display tabs and trailing spaces
set list
set listchars=tab:»⋅,trail:⋅,nbsp:⋅

" filename and type
set statusline+=%t%y

" warn if fileformat isn't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" warn if file encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" warn if &et is wrong, we have mixed-indenting
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

" warn if we have syntax errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%r      " read only flag
set statusline+=%m      " modified flag
set statusline+=%=      "left/right separator
set statusline+=\ \ %c, "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set wildmenu                " enable c-n and c-p to scroll through matches
set wildmode=list:longest   " cmdline tab completion
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing

" comprehensive saving and quiting
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" display settings
set t_Co=256
syntax on
colorscheme jellybeans

" GUI options
if has("gui_running")
  set guifont=Monaco\ 10
  set guioptions-=T          " no toolbar
  set guioptions-=m          " no menu
  set guioptions-=r          " no right side scrollbar
  set guioptions-=L          " no left side scrollbar
  set guioptions+=c          " console messages rather than GUI dialogs
  set guicursor+=a:blinkon0  " no cursor blinking
  set mousehide              " hide mouse when start typing
endif

" filetypes
au BufRead,BufNewFile Rakefile      set filetype=ruby
au BufRead,BufNewFile rakefile      set filetype=ruby
au BufRead,BufNewFile *.rake        set filetype=ruby
au BufRead,BufNewFile .irbrc        set filetype=ruby
au BufRead,BufNewFile *.rjs         set filetype=ruby
au BufRead,BufNewFile *.rhtml       set filetype=eruby
au BufRead,BufNewFile *.html.erb    set filetype=eruby
au BufRead,BufNewFile *.ldg         set filetype=ledger
au BufRead,BufNewFile *.feature     set filetype=cucumber
au BufRead,BufNewFile .vimperatorrc set filetype=vim
au BufRead,BufNewFile .rvmrc        set filetype=sh

" omni completion
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType python     set omnifunc=pythoncomplete#Complete
au FileType c          set omnifunc=ccomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html       set omnifunc=htmlcomplete#CompleteTags
au FileType css        set omnifunc=csscomplete#CompleteCSS
au FileType xml        set omnifunc=xmlcomplete#CompleteTags

" leader -> ,
let g:mapleader = ","

" ; -> :
nnoremap ; :

" vim-ruby options
compiler ruby                " enable compiler support for ruby
let g:rubycomplete_rails = 1 " load rails environment for rails project's files

" Gist-vim options
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'firefox %URL%'

" <F2> toggles paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Don't show the help screen on <F1>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use regular regexps
nnoremap / /\v
vnoremap / /\v

" Yank from cursor to EOL
nnoremap Y y$

" <C-L> clear highlights
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
  inoremap <C-L> <C-O>:nohls<CR>
endif

" Command-T
" Maximum window height
let g:CommandTMaxHeight = 15

" Always display and search hidden files/directories
let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTScanDotDirectores = 1

" Show the match window at the top of the screen
let g:CommandTMatchWindowAtTop = 1

" Fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Git push<CR>
map <Leader>gb :Gblame<CR>

" NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Let NERDTree change my working directory if its root changes
let NERDTreeChDirMode=2

" Show hidden files
let NERDTreeShowHidden=1

" Ack
nnoremap <leader>a :Ack<Space>

" Syntastic options
let g:syntastic_enable_signs=1   " points error lines with arrows
let g:syntastic_quiet_warnings=1 " only show errors

" keeping history data
set viminfo='10,\"30,:20,%,n~/.viminfo

" cursor at the same position as it were on last edit
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" Removes trailing whitespaces
nnoremap <silent> <leader>f :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Open vsplit and switch over to it
nnoremap <leader>vs <C-w>v<C-w>l

" Open hsplit and switch over to it
nnoremap <leader>hs <C-w>s<C-w>j

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
au BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
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
au cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

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

"recalculate the tab warning flag when idle and after writing
au cursorhold,bufwritepost * unlet! b:statusline_tab_warning

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
