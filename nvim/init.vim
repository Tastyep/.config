" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'prabirshrestha/vim-lsp' " vim-lsp
" Plug 'jackguo380/vim-lsp-cxx-highlight'

" auto formatter
Plug 'rhysd/vim-clang-format'

" auto complete
Plug 'Valloric/YouCompleteMe'

" linting (syntax checking and semantic errors)
Plug 'dense-analysis/ale'

" nerd tree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" fuzzy finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" surround vim
Plug 'tpope/vim-surround'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Multi cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'bfrg/vim-cpp-modern'

" Theme
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" ================ AutoStart ========================

" Load theme
autocmd vimenter * ++nested colorscheme gruvbox

"" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" ================ Folds =======================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ YCM buffer ==================

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" ================ UltiSnip ====================

let g:UltiSnipsExpandTrigger="<c-T>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ================ Theme =======================

let g:gruvbox_contrast_dark = 'hard'

" ================ Srolling ====================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
 
" ================ Encoding ====================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" ================ Indentation =================

set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" ================ Number column ===============
 
" numbers
set number " see the line number column

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu
" we don't want to see relative numbering while debugging
" debugger uses its own window, so we can disable rnu when source window loses
" focus
autocmd BufLeave * :set nornu
autocmd BufEnter * call SetRNU()
function! SetRNU()
    if(mode()!='i')
        set rnu 
    endif
endfunction


" ================ Searching ===================

" Ignorecase when searching
" set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" =============== Navigation ===================

" Wrap around lines with arrow keys
set whichwrap+=<,>,[,]

" =============== Mappings =====================

nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

nmap <S-M-f> :ClangFormat<CR>
imap <S-M-f> <Esc><S-M-f>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
