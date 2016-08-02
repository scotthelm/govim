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
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'fatih/vimgo'
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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
