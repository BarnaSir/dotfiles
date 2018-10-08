set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
runtime macros/matchit.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tmhedberg/matchit'
Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup'
Plugin 'tomasr/molokai'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/simpylfold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline',{ 'rtp': 'powerline/bindings/vim/' }
" Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
" Plugin 'vim-scripts/Pydiction'
call vundle#end()
filetype plugin indent on
"markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
let g:instant_markdown_autostart = 1

set nocompatible " be iMproved
set autoindent
set smartindent
set tabstop=2
set pastetoggle=<F10>
set ruler
set hlsearch
set incsearch
set ignorecase
set noro
set clipboard=unnamedplus    
set smartcase
set cursorline
set cuc cul"
set history=100
set mouse=a
let python_highlight_all = 1
syntax on
set backspace = eol
set noswapfile
set sw=2
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css;
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

let g:SimpylFold_docstring_preview = 1 "comment out later
ab er <%  %><Left><Left><Left><Left>
ab err <%=  %><Left><Left><Left><Left>
map ; :
map ff :!
" ================
let mapleader = " "
imap jj <esc>
map <Leader>bb :!bundle install<cr>
map <Leader>rc :!rails console<cr>
map <Leader>bbp :!bundle install --without production<cr>
map <Leader>rb :!irb<cr>
"map <silent> <C-n> :NERDTreeToggle<CR>
map <leader>q :NERDTreeToggle<CR>
nnoremap <silent><C-l> <C-w><C-w><CR>
inoremap <silent><C-l> <C-w><C-w><CR>
vnoremap <silent><C-l> <C-w><C-w><CR>
nnoremap <CR> :noh<CR><CR>
"toggle between the windows
noremap <tab> <C-w><C-w><o><CR>
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai
" Show trailing whitespace and spaces before a tab:
highlight BadWhitespace ctermbg=red guibg=darkred
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/
"Lovely linenumbers
set nu
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" Move between the planes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
" splitting between planes
set splitright
set splitbelow

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"create new tab
nnoremap <leader>t :tabnew<Enter>
nnoremap <leader>\ :tabonly<Enter>

" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" "you-complete-me configuration
" let g:ycm_autoclose_preview_window_after_completion = 1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration <CR>
" let g:ycm_python_binary_path = 'python3'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
setfiletype htmldjango
"run python file from vim
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
