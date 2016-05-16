" Pathogen 'Package Manager'
execute pathogen#infect()

:set backspace=indent,eol,start

" Mouse
set ttyfast
set mouse=a
set ttymouse=xterm2

" Solarized Dark
set background=dark
colorscheme solarized

" General
syntax on
set ai
set sw=4
set ts=4
set sts=4
set expandtab
set nu
filetype plugin indent on

" Tags
set tags=./tags,tags;$HOME

" Wild Mode
set wildmode=longest,full
set wildmenu

" Remove whitespace at end of lines
autocmd BufWritePre * :%s/\s\+$//e

" Erlang
autocmd BufWritePost *.erl :Autoformat
au BufNewFile,BufRead *.config set filetype=erlang
au BufNewFile,BufRead *.config.src set filetype=erlang
au BufNewFile,BufRead *.dtl set filetype=html
:set formatoptions+=r
let erl_company = "Nicholas Gates"

" Markdown
let g:vim_markdown_folding_disabled=1
map <C-S-c> :Toch<CR>

" HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Python
let python_highlight_all = 1
let g:jedi#show_call_signatures = "2"

" Vim Autoformat
let g:formatterpath = ['~/.vim/formatters']
let g:formatdef_erlangfmt = '"erlang_emacs.sh ".bufname("%")'
let g:formatters_erlang = ['erlangfmt']

" Syntastic
hi clear SignColumn
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_erlang_checkers=['syntaxerl']
let g:syntastic_python_checkers=['python', 'pyflakes', 'pep8']
let g:syntastic_aggregate_errors = 1

" Toggle Location List
let g:lt_location_list_toggle_map = '<C-c>'
let g:lt_quickfix_list_toggle_map = '<C-q>'
" quit if quicklist is the last pane open
autocmd BufEnter * if (winnr("$") == 1 && &filetype == "qf") | q | endif

" Status Line
set statusline=%f        " relative path of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}]  "file format
set statusline+=%h       " help file flag
set statusline+=%m       " modified flag
set statusline+=%r       " readonly flag
set statusline+=%y       " filetype
set statusline+=%=       " left/right separator
set statusline+=%c       " cursor col
set statusline+=%l/%L    " cursor line / total lines
set statusline+=\ %P     " percent through file
set laststatus=2

" NerdTree
let g:NERDTreeDirArrows=0
map <C-a> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Autocompletion with tab
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-x>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
