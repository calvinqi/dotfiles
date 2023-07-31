set nocompatible
syntax enable
set autoindent
set tabstop=4
set shiftwidth=4
set scrolloff=5
set expandtab
set wildmenu
set showmatch
set ruler
set ignorecase
set hlsearch
highlight Search ctermbg=black ctermfg=yellow term=underline
map <esc><esc> :nohl<CR>
nnoremap j gj
nnoremap k gk
set noerrorbells
set novisualbell

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
