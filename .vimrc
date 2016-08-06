set nocompatible              " be iMproved, required
filetype off                  " required

"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

"-------------------------------------------------------------------------------
" basics
"-------------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set number

"-------------------------------------------------------------------------------
" basics
"-------------------------------------------------------------------------------
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

" ------------------------------------------------------------------------------
"  Tabs/Spaces
" ------------------------------------------------------------------------------
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
set expandtab

" ------------------------------------------------------------------------------
"  Background Colors
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
execute "set colorcolumn=" . join(range(81,335), ',')

" ------------------------------------------------------------------------------
"  cursor shape
" ------------------------------------------------------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ------------------------------------------------------------------------------
" custom crap
" ------------------------------------------------------------------------------
let mapleader = ","
" Quickly hide search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>

" ------------------------------------------------------------------------------
" Window navigation
" ------------------------------------------------------------------------------
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" ------------------------------------------------------------------------------
" Ctrl P
" ------------------------------------------------------------------------------
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|tags$\|\.ds_store$|\.swp$'
let g:ctrlp_dotfiles = 0

" ------------------------------------------------------------------------------
"  Vim-Go
" ------------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
