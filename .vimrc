" ============================================================================== 
" SPACES AND INDENTS 
" ==============================================================================

" width of tab character
set tabstop=4

" fine tunes the amount of white space to be added
set softtabstop=4

" determines the amount of whitespace to add in normal mode
set shiftwidth=4

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
" COLOR 
" ==============================================================================
 
" enable syntax hilighting
syntax on

" ==============================================================================
" DISPLAY FEATURES
" ==============================================================================

" display line numbers on the left
set number

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

" customize status bar display
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#LineNr#
" set statusline+=%{StatuslineGit()}
set statusline+=\ %f
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

" ==============================================================================
" MISCELLANEOUS
" ==============================================================================

" ignores these patterns when opening files using glob
set wildignore+=.pyc,.swp
