" Language: Python
" PEP8 Compliance {{{
setlocal fileformat=unix " LF line endings

setlocal autoindent      " Automatically indent based on current indention
setlocal smartindent     " Automatically change indentation based on syntax, ignored by `cindent` and `indentexpr`
setlocal shiftwidth=4    " width to indent from indent or `cindent`
setlocal shiftround      " Round indent to multiple of `shiftwidth`

setlocal expandtab       " Automatically convert <Tab> to spaces
setlocal smarttab        " Inserts tabs based on shiftwidth
setlocal tabstop=4       " 4 character widths for tabs
setlocal softtabstop=4   " <Tab> and <Backspace> character length
" }}}

" Folding {{{
setlocal foldmethod=indent " Fold based on indentation, possibly change to syntax?
setlocal foldignore=       " Ignore blank lines so they do not start a new fold
setlocal foldnestmax=2     " Don't fold first instance of foldmethod
" }}}

" Searching {{{
setlocal suffixesadd+=.py " prioritize searching for `.py` files
" }}}

" Documentation key: `K` {{{
" Typing `K` while in Normal mode will open documentation for whatever word the cursor is on
setlocal keywordprg=pydoc " Use python documentation for `.py` files
" }}}
