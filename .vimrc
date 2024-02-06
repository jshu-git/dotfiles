" https://github.com/vim/vim/blob/master/runtime/defaults.vim
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=200
set mouse=a                    " enable mouse support
set nocompatible
set nrformats-=octal           " don't recognize octal for C-a and C-x
set ruler
set showcmd                    " display incomplete commands
set ttimeout                   " timeout for key codes
set ttimeoutlen=100            " wait upt to 100ms after Esc for special key
set wildmenu                   " display completion matches in a status line
syntax on

" https://old.reddit.com/r/vim/comments/11ntbmv/whats_your_vimrc_setup_for_2023/
filetype on
set autoindent
set expandtab " use spaces instead of tabs
set hidden
set hlsearch  " highlight search results
set nobackup
set noswapfile
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set background=dark
set laststatus=2 " always show status line
set noshowmode " don't show mode as lightline already does

" change cursor in modes https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_EI="\e[2 q"
let &t_SI="\e[6 q"





" plugins
" https://github.com/junegunn/vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
Plug 'chaoren/vim-wordmotion'
Plug 'christoomey/vim-sort-motion'
Plug 'github/copilot.vim'
Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow' " rainbow parentheses
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/vim-cool'    " disable search highlighting after
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'  " more text objects
call plug#end()








let mapleader = " "

" unmap command window
nnoremap q: <Nop>

" search visually selected text
xnoremap * y/<C-R>"<CR>
xnoremap # y?<C-R>"<CR>

" repeat v to select more in visual
xnoremap v j
xnoremap V j
xnoremap <C-v> j
" yank to end of line
nnoremap Y y$

" center cursor
noremap n nzz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap { {zz
noremap } }zz

" undo
noremap U <C-r>

" cw 'standard' behavior https://stackoverflow.com/a/41793667
nnoremap cw dwi
nnoremap cW dWi

" indent/outdent with tab/shift-tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" add line below
nnoremap <CR> o<Esc>

" better movement
nnoremap j gj
nnoremap k gk

" delete backwards
nnoremap <bs> X

" move one character to the left/right in insert mode
inoremap ll <right>
inoremap hh <left>

" replace with yanked text without changing the default register
xnoremap <leader>p "_dP

" yank to system clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y

" fast save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" fast reload
noremap <C-r> :source $MYVIMRC<CR>

" insert mode mappings
" move to end of word
inoremap <C-f> <Esc>ea
" move to beginning of word
inoremap <C-b> <Esc>bi

" recursive maps
nmap <leader>Y "+Y
" move to beginning/end of line
map L g$
map H ^"0

" move 6 lines up/down
map K 6k
map J 6j

" change word
nmap s ciw
nmap S caw
" delete word
nmap X daw







" plugins
" commenting
nmap <C-c> gcc
xmap <C-c> gc

" easy align
map ga <Plug>(EasyAlign)


" yank highlight
let g:highlightedyank_highlight_duration = 100

" strip whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_confirm  = 0
let g:strip_whitespace_on_save  = 1

" rainbow parentheses
let g:rainbow_active    = 1
" disable parentheses highlighting
let g:loaded_matchparen = 1

" fzf
noremap <leader>ff :Files<CR>
noremap <leader>fr :RG<CR>
" buffer navigation
noremap <leader>bb :Buffers<CR>
noremap <leader>b[ :bp<CR>
noremap <leader>b] :bn<CR>
noremap <leader>bd :bd<CR>

" vim-cool
let g:cool_total_matches = 1

" lightline
let g:lightline = {
      \ 'colorscheme': '16rosepine',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': [ [ 'readonly' ], ]
      \    },
      \ }

" no more auto commenting https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
au FileType * set fo-=c fo-=r fo-=o

