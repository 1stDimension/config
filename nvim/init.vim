set nu
set rnu
set expandtab
set smarttab
set shiftwidth=2
set ai

set spelllang=en_gb,pl
set wildignore=*.docx,*.jpg,*.jpeg,*.webp,*.mp4,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set spellsuggest+=10

set undodir=~/.vimdid
set undofile

set nocompatible

syntax on
filetype plugin indent on

call plug#begin()

 Plug 'vimwiki/vimwiki'

 Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }

 Plug 'dense-analysis/ale'
 Plug 'junegunn/fzf'
 Plug 'itchyny/lightline.vim'
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'

 Plug 'godlygeek/tabular'
 Plug 'preservim/vim-markdown'

 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-treesitter/nvim-treesitter-context'
 Plug 'nvim-treesitter/playground'
 Plug 'mbbill/undotree'

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['gopls'],
    \ 'terraform': ['terraform-ls', 'serve'],
    \ }

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

 let g:ale_linters = {'rust': ['analyzer']}

