" ${HOME}/.vimrc
" General Settings {{{
if &compatible | set nocompatible | endif " Avoid side effects if `nocp` already set

" if MYVIMRC is empty, load this file as MYVIMRC
if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

let g:netrw_home=$HOME."/.vim"
let g:netrw_liststyle=3 " Tree list style

set viewdir=$HOME/.vim/view

" 'Write is not used as a verb, but an adjective'
set backup      " Automatically write backup for current file
set nowriteback " Don't keep older backups than the current/recent one, on :write (:w) command
set backupdir=$HOME/.vim/backup

set swapfile
set directory=$HOME/.vim/swap

if has('persistent_undo') " Ensure vim version has undo support
  set undofile            " Enable undofile
  set undodir=$HOME."/.vim/undo
endif

set viminfo=%,<1024,'16,/64,:128,h,f0,n$HOME/.vim
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set history=1024
set undolevels=1024

" NOTE: This can affect some plugins
set updatetime=750 " Time (in miliseconds) before updating swapfile and CursorHold event

set shortmess+=I
set ff=unix            " Use unix-style linefeed `LF` for files
set encoding=utf-8     " Use Unicode inside Vim's registers, viminfo, buffers...
set fileencoding=utf-8 " Output encoding of the file that is written.
set termencoding=utf-8 " Output encoding of terminal
" }}}

" Misc {{{
" Suffixes that get lower priority when doing tab completion for filenames
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
" Automatically update file if edited externally
set autoread
set backspace=indent,eol,start " Fix backspace issues
" }}}

" Bell {{{
set noerrorbells " Disable audible error bell
set visualbell   " Display blinking cursor on error bell
set t_vb=        " Disable visual bell
" }}}

" Brace Highlighting {{{
set showmatch       " Enable flashing visual cue for [] {} and () matching
set matchpairs+=<:> " Add <>, Useful for HTML/XML editing
set matchtime=3     " Blink (in tenth of seconds) when matching brackets
" }}}

" Clipboard {{{
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif

set t_BE= " Fix paste through ssh
" }}}

" Cursor {{{
set ruler        " Show cursor info in bottom-right corner (row, column, percentage of document length)
" set cursorline   " Enable highlight on current cursor line
" set cursorcolumn " Enable highlight on current cursor column
" }}}

" Diff {{{
set diffopt=vertical " Vertical split when using diffsplit (show diffs side by side)
set diffopt+=filler  " Show filler lines to keep vertical diffs synced
set diffopt+=iwhite  " Ignore all whitespace and sync
" }}}

" File & Directory Browsing {{{
" vim documentation says `autochdir` may break plugins, so beware
set autochdir         " Changes the cwd to the directory of the current buffer whenever you switch buffers
set browsedir=current " Make the file browser always open the current directory
set path+=**          " search subfolders recursively
" }}}

" Folding {{{
" Enable this when you know more what you're doing
" set foldmethod=marker " use markers (triple curly braces unless changed) for folding
" set foldnestmax=10
" }}}

" Interface Display {{{
set title	            " Change the terminal's title
set display+=lastline "
set laststatus=2      " Always display the status line
set showcmd           " Echo command at bottom
set showmode          " Show vim-mode at bottom
set cmdheight=2       " this gives bottom line enough space to keep function hint on
" }}}

" String Character Settings {{{
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" }}}

" Line Settings {{{
set number         " Enable left-hand gutter for line numbers
set numberwidth=3  " Zero-pad line numbers in gutter to 3 digits
set signcolumn=yes " Enable always displaying sign column
" }}}

" Modeline {{{
if &modeline | set modeline | endif
set modelines=3
" }}}

" Performance {{{
set lazyredraw    " Don't update the display while executing macros
set synmaxcol=512 " Don't parse syntax past column `512`
set ttyfast       " Enable fast-scrolling
" }}}

" Scrolling {{{
set scrolloff=5     " start scrolling when we're 8 lines away from margins
set sidescroll=1    " enable sidescrolling too
set sidescrolloff=5 " start sidescrolling 8 chars away from margins
" }}}

" Search {{{
set incsearch  " Show first matching search result as the search pattern is typed
set ignorecase " Disable case-sensitive searching
set smartcase  " Automatically put a \C if capitalization, so start case-sensitive searching
set hlsearch   " Highlight search pattern matches
set wrapscan   " wrap around when searching
" set magic      " Enable to allow regular expressions in searching
" }}}

" Splitting {{{
set splitbelow " Split below
set splitright " Split to the right
" }}}

" Tabs & Indention {{{
set noexpandtab   " <Tab> uses `\t`, not spaces
set softtabstop=0 " <Tab> & <BS> use `\t`
set tabstop=4     " <Tab> is 4 columns
set smarttab      "
set autoindent    " Enable indenting based on current line indent
set shiftwidth=4  "
set shiftround    "
" }}}

" Wildmenu {{{
set wildmenu                   " Enable wildmenu
set wildmode=list:longest,full " First <Tab> fills the longest common string, further tabs cycle through list

set wildignore+=*/.git/**/*,.gitkeep             " Git
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.manifest       " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=.tmp
set wildignore+=*/.coverage,.coverage/**
set wildignore+=*/__pycache__/*,*.pyc             " Python bytecode files and directories
set wildignore+=*/.venv/*,*/virtualenv/*,*/venv/* " Python virtual environments
set wildignore+=*.egg,*.egg-info                  " python eggs
set wildignore+=migrations                        " Python :: Django migrations
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz " Compressed files
set wildignore+=*~,._*
set wildignore+=*.bak
set wildignore+=*/tmp/*
set wildignore+=*.dll,*.so
" }}}

" Wrapping {{{
set textwidth=0  " Disable wrapping text based on length
set wrapmargin=0 " Disable wrapping margins
set nowrap       " Disable wrapping
" }}}

" Filetype Settings {{{
" Filetype :: misc {{{
" Don't write backup file if vim is being called by `crontab -e`
autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by `chpass`
autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup
" }}}

" Filetype :: git {{{
" Git 72 character limit for git commit messages
autocmd FileType gitcommit set textwidth=72    " For commit message max length
autocmd FileType gitcommit set colorcolumn=73  " For commit message max length reminder
autocmd FileType gitcommit set colorcolumn+=51 " For commit message title max length reminder
" }}}
" }}}

" Packages {{{
" package :: ale {{{
" package :: ale :: general setting
let g:ale_completion_enabled=0
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_format='[%linter% - %severity%] %s '

let g:ale_set_signs=1          " Enable signs
let g:ale_set_highlights=1     " Enable sign highlights
let g:ale_sign_column_always=1 " Enable always showing sign column

let g:ale_sign_info='I'
let g:ale_sign_warning='W'
let g:ale_sign_error='E'

" package :: ale :: fixer settings
let g:ale_fix_on_save=1 " Enable automatic fixing upon saving file

let g:ale_fixers={'python' : ['isort']}

" package :: ale :: fixer :: isort
let g:ale_python_isort_executable='python3' " Executable to use for isort
let g:ale_python_isort_options='-m isort'   " Options to use with isort
let g:ale_python_isort_use_global=0         " Use virtual environment, if found

" package :: ale :: linter setting
let g:ale_linters_explicit=1           " Enable only running linters named in `ale_linters` settings
let g:ale_lint_on_text_changed='never' " Disable overzealous linting
let g:ale_lint_on_enter=0              " Disable linting on file open
let g:ale_lint_on_insert_leave=1       " Enable linting upon leaving Insert mode
let g:ale_lint_on_save=1               " Enable linting upon saving (:w)
let g:ale_lint_delay=500               " Set time (in milliseconds) before autolinting

" package :: ale :: linters
let g:ale_linters={'python': ['flake8']}

" package :: ale :: linter :: flake8
let g:ale_python_flake8_change_directory=1   " Use directory of the python file to check for a `.flake8` file
let g:ale_python_flake8_executable='python3' " Ensure we use properly
let g:ale_python_flake8_options='-m flake8'  " Use these options when running flake8
let g:ale_python_flake8_use_global=0         " Use virtual environment first, if found
" }}} /package :: ale

" package :: code-completion :: jedi-vim {{{
let g:jedi#auto_close_doc=1                 " Enable closing preview window upon leaving insert mode
let g:jedi#use_tabs_not_buffers=1           " U
" let g:jedi#use_splits_not_buffers="right" " open the go-to function in split, not another buffer
" }}} /package :: jedi-vim
" }}} /Packages

" Colors {{{
" Ensure syntax is enabled before setting background
" Ensure background is set before setting colorscheme
set t_Co=256
set background=dark

let g:solarized_termcolors=16 " 16 seems to provide better colors than `256`
let g:solarized_termtrans=1
" let g:solarized_bold=1
" let g:solarized_degrade=0
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme solarized

" Change highlights after declaring `colorscheme` to override
highlight SignColumn     ctermbg=0    ctermfg=NONE " bright black
highlight ALEErrorSign   ctermbg=0    ctermfg=9    " red on bright black
highlight ALEWarningSign ctermbg=0    ctermfg=3    " yellow on bright black
highlight ALEInfoSign    ctermbg=0    ctermfg=6    " green on bright black
" }}}
