" PEP8 Compliance {{{
setlocal fileformat=unix
" setlocal smartindent
setlocal autoindent
setlocal expandtab      " Tab -> spaces
setlocal shiftround     " Round indent to multiple of `shiftwidth`
setlocal shiftwidth=4   " width to indent from cindent or indent
setlocal smarttab       " Set tabs for shiftwidth
setlocal softtabstop=4  " <Tab> and <Backspace> character length
setlocal tabstop=4      " 4 character widths for tabs
" }}}

" Folding {{{
setlocal foldmethod=indent
" Without next, blank lines would start new fold...
setlocal foldignore=
setlocal foldnestmax=2
" }}}

" Searching {{{
setlocal suffixesadd+=.py
" }}}

let b:ale_linters = ['pylsp']
let b:ale_fixers = ['yapf', 'isort']

" Formatoptionen setzen:
" a: automatic formatting of paragraphs when insering or deleting (nervt!!!)
" c: automatic formatting for comments
" t: automatic formatting for text
" r: repeat comment chars
" j: remove comment leader when joining lines
" n: numbered lists
" q: reformat comments with 'gq'
" l: Long lines are not broken in insert mode
" o: automatically insert the current comment leader after 'o' or 'O'
" w: trailing white space indicates a paragraph continues in the next line


" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
setlocal formatoptions-=c formatoptions-=o formatoptions-=r

" automatically close {[(
inoremap <buffer> [ []<esc>i
inoremap <buffer> ( ()<esc>i
inoremap <buffer> { {}<esc>i
" automatically close '"
inoremap <buffer> " ""<esc>i
inoremap <buffer> ' ''<esc>i

" {{{ Mappings
" CTRL K moves to the function definition above
" CTRL J moves to the function definition below
nmap <leader>k [pf
nmap <leader>j ]pf
