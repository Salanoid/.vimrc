" ========== Plugin Manager ==========
call plug#begin('~/.vim/plugged')

" File navigation
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Ruby and Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Commenting
Plug 'tpope/vim-commentary'

" Better search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Surroundings like (), {}, "", etc.
Plug 'tpope/vim-surround'

" Markdown
Plug 'plasticboy/vim-markdown'

" Test runner
Plug 'vim-test/vim-test'

" Useful mappings
Plug 'tpope/vim-unimpaired'

" Optional: syntax highlighting for Rust, TypeScript, Go, Java
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'uiiaoo/java-syntax.vim'

" Theme
Plug 'joshdick/onedark.vim'

call plug#end()

" ========== General Settings ==========
syntax on
filetype plugin indent on
set autoindent
set number
set relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set hidden
set clipboard=unnamedplus
set mouse=a
set scrolloff=5
set updatetime=300
set signcolumn=yes
set tabstop=2 shiftwidth=2 expandtab shiftround
set bs=2
set history=100
set autowrite
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set nowrap
set list listchars=tab:»·,trail:·,nbsp:·

" ========== Leader and Remaps ==========
let mapleader = " "

" Save file
nnoremap <leader>w :w<CR>

" Quit
nnoremap <leader>q :q<CR>

" Replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Open NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Use ripgrep with fzf for live grep search
if executable('rg')
  " Search word under cursor with <leader>F
  nnoremap <leader>F :Rg <C-R><C-W><CR>
  " Interactive live grep with <leader>f
  nnoremap <leader>f :Rg<Space>
endif

" Pure Vim project-wide search & replace
" Use ripgrep as grep backend
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

function! ProjectReplace()
  let old = input('🔍 Search for: ')
  if empty(old)
    echo "❌ Cancelled"
    return
  endif

  let new = input('🔁 Replace with: ')
  if empty(new)
    echo "❌ Cancelled"
    return
  endif

  " Save command to run after grep populates quickfix
  let g:LastProjectReplaceCmd = ':cfdo %s/' . escape(old, '/') . '/' . escape(new, '/') . '/gc | update'

  " Use grep to populate quickfix list using ripgrep
  execute 'silent grep! ' . shellescape(old)

  " Show quickfix list
  copen

  echo "✅ Run :ProjectDoReplace or <leader>sR to confirm replacements"
endfunction

function! ProjectDoReplace()
  if exists('g:LastProjectReplaceCmd')
    execute g:LastProjectReplaceCmd
  else
    echo "⚠️ No saved replacement command found"
  endif
endfunction

" Mappings
nnoremap <leader>sr :call ProjectReplace()<CR>
nnoremap <leader>sR :call ProjectDoReplace()<CR>

" Mappings
nnoremap <leader>sr :call ProjectReplace()<CR>
nnoremap <leader>ry :call ProjectDoReplace()<CR>

" Generate ctags (requires `ctags -R` available)
nnoremap <leader>t :!ctags -R .<CR><CR>

" Paste from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" ========== Kitty Integration ==========
" Enable bracketed paste and proper clipboard integration
set ttymouse=sgr

" ========== Pane Navigation ==========
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ========== Plugin Settings ==========

" CtrlP
let g:ctrlp_cmd = 'CtrlP'

" NerdTree
let g:NERDTreeShowHidden=1

" Vim-Test
let test#strategy = "neovim"

" Vim-Markdown
let g:vim_markdown_folding_disabled = 1

" Rust plugin (optional)
let g:rustfmt_autosave = 1

" Elixir format (optional)
autocmd BufWritePre *.exs,*.ex :silent! execute '%!mix format -'

" ========== Autocommands ==========
" Automatically reload file if changed externally
autocmd FocusGained,BufEnter * checktime

" Highlight on yank
augroup HighlightYank
  autocmd!
  autocmd TextYankPost * silent! call matchadd('IncSearch', '\%'.line("v").'l')
  autocmd TextYankPost * silent! redraw | sleep 150m | call clearmatches()
augroup END

" ========== Optional Performance Tweaks ==========
set lazyredraw

" ========== Colorscheme ==========
if has('termguicolors')
  set termguicolors
endif
colorscheme onedark
