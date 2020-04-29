set backspace=indent,eol,start " backspace over everything in insert mode
set nocompatible               " be improved, required
filetype off                   " required

" vim-plug manager
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"Plug 'sirver/ultisnips'
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'itchyny/lightline.vim'

Plug 'sainnhe/gruvbox-material'

Plug 'scrooloose/nerdcommenter'

"Plug 'tmhedberg/SimplyFold'

"Plug 'vim-scripts/indentpython.vim'

"Plug 'Valloric/YouCompleteMe'

" Syntax checking/highlighting
"Plug 'vim-syntastic/syntastic'

Plug 'scrooloose/nerdtree'

" Fuzzy searching
"Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Distraction free writing
Plug 'junegunn/limelight.vim'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Conquer of Completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


syntax enable
"colorscheme monokai
set rnu
set ts=4
set tw=80
set expandtab
set autoindent
set wildmenu
set showmatch
set incsearch
set nohlsearch
set linebreak
set ttimeoutlen=0
set laststatus=2
set noshowmode
" Lets you edit another file without saving the current
set hidden

" GUI enhancements
" Set nice colors for 256 terminal
if !has('gui_running')
  set t_Co=256
endif
" Set the airline colorscheme
let g:lightline = {'colorscheme' : 'gruvbox_material'}
" Set colorscheme
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material

" REMAPS
" Inserting a real Tab when pressing Shift + Tab
":inoremap <S-Tab> <C-V>Tab>
" Move between wrapped lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
" Double-j as ESC
inoremap jj <Esc>


" PYTHON DEVELOPING
" Folding
set foldmethod=indent
set foldlevel=99
" Remap <Space> to <za>
nnoremap <space> za

" PEP8 standards
"au BufNewFile,BufRead *.py
    "\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=150 "it's 79, but that's too low
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix
" For full stack
"au BufNewFile,BufRead *.js, *.html, *.css
    "\ set tabstop=2
    "\ set softtabstop=2
    "\ set shiftwidth=2

" Flag unnecessary whitespaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UTF-8 support
set encoding=utf-8

" For YouCompleteMe plugin...
" ...window goes away when you're done
"let g:ycm_autoclose_preview_window_after_completion=1
" ...shortcut for goto definition
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" Use pretty python highlighting
"let python_highlight_all=1

" Use the system clipboard
set clipboard=unnamed

" Open NERDTree when opening a folder
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" Open NERDTree when no argument is given
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with a shortcut
map <C-n> :NERDTreeToggle<CR>
