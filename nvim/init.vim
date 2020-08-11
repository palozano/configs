set backspace=indent,eol,start " backspace over everything in insert mode
set nocompatible               " be improved, required
filetype off                   " required

" VIM-PLUG MANAGER
" ================
call plug#begin('~/.config/nvim/plugins')

Plug 'lervag/vimtex'
let g:tex_flavor='pdflatex'
let g:vimtex_view_method='zathura'
"let g:vimtex_view_general_viewer = 'open'
"let g:vimtex_view_general_options = '-a Skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'

" Better statusline 
Plug 'itchyny/lightline.vim'
" Colorscheme
Plug 'sainnhe/gruvbox-material'
"Plug 'arcticicestudio/nord-vim'
" Clever commenter
Plug 'scrooloose/nerdcommenter'
"Plug 'sheerun/vim-polyglot'
" File tree in editor
Plug 'scrooloose/nerdtree'
" Distraction free writing
Plug 'junegunn/goyo.vim'
"Highlighting sections of writing
Plug 'junegunn/limelight.vim'
" Real fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Conquer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git within file
Plug 'airblade/vim-gitgutter'
" Git all around
Plug 'tpope/vim-fugitive'
" Close tags
Plug 'alvan/vim-closetag'
" Undo Treee
Plug 'mbbill/undotree'
" Icons in NERDTree
Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" SOME SETTINGS
" ====================
syntax enable
" Show numbers
set relativenumber
set number
" Use wide tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
" For old terminals
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

" Decent wildmenu
set wildmenu
set wildmode=list:longest
" Brackets
set showmatch
" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault
set nohlsearch
" Highlight current line
set cursorline
" Proper line wrap 
set linebreak
set ttimeoutlen=0
set laststatus=2
"set laststatus=0
"set noshowmode
set hidden
" No whitespace in vimdiff
set diffopt+=iwhite 
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
" Sane splits
set splitright
set splitbelow
" Permanent undo
set undodir=~/.config/nvim/.vimdid
set undofile
" Folding
set foldmethod=indent
set foldlevel=99
" Use UTF-8 support
set encoding=utf-8
" Use the system clipboard
set clipboard=unnamedplus
" No bells
set noerrorbells
" Smart indent (?)
set smartindent
" Lines off in the scroll
set scrolloff=2



" CLOSING TAGS
" ===========
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


" REMAPS
" ======
" Remap leader key
let mapleader = "\<Space>"
" Move between wrapped lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
" ESC wit jj
:imap jj <Esc>
" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
" Toggle to previous buffer
nnoremap <leader><leader> <c-^>
" Indent with only one stroke
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv
" Get out of the terminal
tnoremap <Esc><Esc> <C-\><C-n>:q!<CR>
" Remap <leader>s for Rg search
noremap <leader>d :Rg
" Open NERDTree with a shortcut
map <C-m> :NERDTreeToggle<CR>
map <C-n> :30Lexplore<CR>
" Open fzf with <C-p>
nnoremap <C-p> :<C-u>FZF<CR>
" Show Undo Tree
nnoremap <leader>u :UndotreeToggle<CR>


" GUI ENHANCEMENTS
" ================
" Set nice colors for 256 terminal
if !has('gui_running')
  set t_Co=256
endif

"let g:lightline = {'colorscheme' : 'gruvbox_material'}

" Show Coc environment in the status line
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" left: in second list --> [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
" right: in third list --> ['fileformat', 'fileencoding', 'charvaluehex']
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [  ],
      \             [ 'readonly', 'filename', 'modified', 'cocstatus', 'currentfunction' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"set termguicolors
colorscheme gruvbox-material
set background=dark

" Open NERDTree when no argument is given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Ripgrep to use grep strings and show results with FZF
let g:fzf_layout = { 'down': '~35%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Run python file with F5
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" CONQUER OF COMPLETION
" =====================
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
"set cmdheight=2
" Longer updatetime (default 4000ms) leads to
" poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
" [g
nmap <silent> `g <Plug>(coc-diagnostic-prev)
" +g
nmap <silent> +g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
