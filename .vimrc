"
" My vimrc.
"

" Use Vim settings
set nocompatible

" Vundle
" From vim  :PluginInstall
" From CLI  vim +PluginInstall +qall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'altercation/vim-colors-solarized'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/closetag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rust-lang/rust.vim'
Plugin 'morhetz/gruvbox'
" Plugin 'blueshirts/darcula'
call vundle#end()

" make backspace work over line breaks
set backspace=2

" Use sensible tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
filetype plugin indent on

" Use sensible search settings
set incsearch
set hlsearch
set ignorecase " Ignore search case unless search contains capitals
set smartcase

" Show line numbers & margin at right.
" Always show 3 lines before/after the cursor.
set ruler
set number
set cc=80
set scrolloff=3

" Show incomplete commands
set history=50
set showcmd

" gruvbox config
let g:gruvbox_contrast_dark='soft'

" Turn on colouring
syntax enable
set background=dark
colorscheme gruvbox

" Enable backups but stuff them away
set backup
set backupdir=~/.vim/backup

" Configure the GUI
set guifont=Monaco:h12
set guioptions-=T

" Close html tags with ctrl-_
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim

" Display whitespace
set listchars=tab:»-,trail:·
set list

" NERDcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Removes trailing whitespace
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
" Bind this to F2
map <F2> :call TrimWhiteSpace()<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler.
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Use , as the leader
let mapleader = ","
nnoremap <Leader>w :w<CR>
map <Leader><Tab> :NERDTreeToggle<CR>

" To toggle VExplore with <Leader><Tab> instead of NERDTree, see:
" See http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/ for details.
