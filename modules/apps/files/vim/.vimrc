" enable syntax highlighting based on filetype
syntax on

" show trailing white space and tabs
set listchars=tab:\T\ ,trail:~,extends:>,precedes:<

" set tabs to 4 space
set softtabstop=4 tabstop=4 shiftwidth=4 smarttab smartindent

" expands tabs to spaces,
" displays whitespace,
" show line numbers,
" and highlight search terms
set expandtab list nu hls

" set folds to indent level
set foldmethod=indent

" sets max number of folds
set foldlevel=99

" shows non-text characters in gray
hi NonText ctermfg=7 guifg=gray