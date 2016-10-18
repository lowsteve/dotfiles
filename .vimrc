"
" My vimrc.
"

" OS name
let s:uname = system("uname")

" Use Vim settings
set nocompatible

" Vundle
" From vim  :PluginInstall
" From CLI  vim +PluginInstall +qall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'altercation/vim-colors-solarized'
Plugin 'townk/vim-autoclose'
Plugin 'vim-scripts/closetag.vim'
call vundle#end()

" Use Tab for completion
imap <Tab> <C-N>

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

" Show line numbers & margin at right
set ruler
set number
set cc=81

" Show incomplete commands
set history=50
set showcmd

" Turn on colouring
syntax enable
set background=dark
if s:uname == "Darwin\n"       "For some reason has('mac') doesn't work
  colorscheme solarized
else
  colorscheme desert
endif

" Enable backups but stuff them away
set backup
set backupdir=~/.vim/backup

" Configure the GUI
set guifont=Consolas:h12
set guioptions-=T

" Close html tags with ctrl-_
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of browser
"let g:netrw_brows_split = 4
"let g:netrow_altv = 1

" Default to tree mode
let g:netrw_liststyle = 3

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler.
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
