" ==============================================================================
" OPENING VIM
" ==============================================================================

" disables opening vim with zero, multiple, or directory argument(s)
if argc() == 0
  echomsg "vimrc: Refusing to open vim without file argument"
  quit
endif

if argc() >= 2
  echomsg "vimrc: refusing to open vim with multiple file arguments"
  quit
endif

for f in argv()
  if isdirectory(f)
    echomsg "vimrc: Refusing to edit directory " . f
    quit
  endif
endfor

" ============================================================================== 
" SPACES / INDENTS 
" ==============================================================================

" width of tab character
set tabstop=4

" fine tunes the amount of white space to be added
set softtabstop=4

" determines the amount of whitespace to add in normal mode
set shiftwidth=4

" use 2-space tabs for Typescript and Proto files
autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType proto setlocal tabstop=2 softtabstop=2 shiftwidth=2

" uses space instead of tabs
set expandtab

" autoindents like in IDEs
set autoindent

filetype plugin indent on
" Prevents autoformatting for comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" ==============================================================================
" DISPLAY / COLOR 
" ==============================================================================
 
" enable syntax hilighting
syntax on

" display line numbers on the left
set number

" make line numbers dark grey
highlight LineNr ctermfg=darkgrey

" sets screen title to name of file
set title

" hilight matching parentheses characters
set showmatch

" hilight searches (use Ctrl-L to temporarily turn off)
set hlsearch

" redraw only when we need to
set lazyredraw

" better command-line completion
set wildmenu

" display status bar always
set laststatus=2

" removes trailing whitespace
command! Removetrailing :%s/[ \t]*$//g

" display ruler after column 80
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey

set statusline=
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=\ %l/%L:%c

hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" ==============================================================================
" EDITING
" ==============================================================================

" prevents lines from wrapping around
set nowrap

" minumum number of lines above and below end
set scrolloff=7

" prevent individual words from being split into two lines
set linebreak

" mouse clicks take you to cursor location
set mouse=a

" prevent cursor randomly moving to front of line
set nostartofline

" ==============================================================================
" FOLDING
" ==============================================================================

" enable folding
set foldenable

" opens most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" fold based on indent level; run ':help foldmethod' for other configs
set foldmethod=indent

" space open/closes folds
nnoremap <space> za

" remember folds even after exiting vim
autocmd BufWinLeave * mkview!
autocmd BufWinEnter * silent loadview

" ==============================================================================
" REMAPPING KEY BINDINGS
" ==============================================================================

command WQ wq
command Wq wq
command W w
command Q q

" Drag down the screen, without changing the cursor location
map <C-Up> <C-Y>
map <C-Down> <C-E>

" Redo previous change with r
map r <C-r>

" Copy/paste/cut to system clipboard
set clipboard=unnamedplus

" 'go back' to the last tag (use after go to definition)
map gb <C-T>

" Split vim pane (horizontally or vertically)
map hsp <C-w>s
map vsp <C-W>v
noremap <C-H> <C-W><Left>
noremap <C-J> <C-W><Down>
noremap <C-K> <C-W><Up>
noremap <C-L> <C-W><Right>
set splitbelow
set splitright

" ==============================================================================
" DISABLE UNUSED KEY BINDINGS
" ==============================================================================

" See https://hea-www.harvard.edu/~fine/Tech/vi.html for all vi commands
map a <Nop>
map b <Nop>
map c <Nop>
map e <Nop>
map f <Nop>
map h <Nop>
map j <Nop>
map k <Nop>
map l <Nop>
map m <Nop>
map s <Nop>
map t <Nop>
map w <Nop>
map x <Nop>

map A <Nop>
map B <Nop>
map C <Nop>
map D <Nop>
map E <Nop>
map F <Nop>
map H <Nop>
map K <Nop>
map L <Nop>
map M <Nop>
map O <Nop>
map Q <Nop>
map R <Nop>
map S <Nop>
map T <Nop>
map U <Nop>
map V <Nop>
map W <Nop>
map X <Nop>
map Y <Nop>
map Z <Nop>

map ! <Nop>
map @ <Nop>
map $ <Nop>
map ^ <Nop>
map & <Nop>
map * <Nop>
map \( <Nop>
map \) <Nop>
map \ <Nop>
map \| <Nop>
map - <Nop>
map _ <Nop>
map = <Nop>
map + <Nop>
map ; <Nop>
map ' <Nop>
map ` <Nop>
map " <Nop>
map ~ <Nop>
map , <Nop>
map . <Nop>

map <C-a> <Nop>
map <C-b> <Nop>
map <C-d> <Nop>
map <C-f> <Nop>
map <C-g> <Nop>
map <C-i> <Nop>
map <C-m> <Nop>
map <C-n> <Nop>
map <C-o> <Nop>
map <C-p> <Nop>
map <C-q> <Nop>
map <C-s> <Nop>
map <C-t> <Nop>
map <C-u> <Nop>
map <C-x> <Nop>
map <C-z> <Nop>

" Disable command history
nnoremap q: <nop>

" ==============================================================================
" MISCELLANEOUS
" ==============================================================================

" ignores these patterns when opening files using glob
set wildignore+=.pyc,.swp

" prevents gofmt from running automatically when saving
let g:go_fmt_autosave = 0
