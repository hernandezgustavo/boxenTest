" start pathogen, installing vim plugins
execute pathogen#infect()

" enable syntax highlighting based on filetype
syntax on
filetype plugin indent on

" show line numbers
set number

" show trailing white space and tabs
set listchars=tab:\T\ ,trail:~,extends:>,precedes:<

" set tabs to 4 space
set softtabstop=4 tabstop=4 shiftwidth=4 smarttab smartindent

map <Leader><Tab> :NERDTreeToggle<CR>
set expandtab list nu hls
set foldmethod=indent
set foldlevel=99
hi NonText ctermfg=7 guifg=gray