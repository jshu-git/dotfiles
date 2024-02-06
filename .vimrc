" https://old.reddit.com/r/vim/comments/11ntbmv/whats_your_vimrc_setup_for_2023/
syntax on
filetype on
set noswapfile
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set nobackup
set hlsearch
set showmatch
set mouse=a
set formatoptions-=cro
set showcmd
set nrformats-=octal
set backspace=indent,eol,start
set hidden
set timeoutlen=400
" change cursor in modes https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"





" plugins
" https://github.com/junegunn/vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle relative/absolute line numbers
Plug 'romainl/vim-cool'                  " disable search highlighting after
Plug 'wellle/targets.vim'                " more text objects
Plug 'ntpeters/vim-better-whitespace'
Plug 'luochen1990/rainbow'               " rainbow parentheses
Plug 'vim-airline/vim-airline'           " status line
Plug 'chaoren/vim-wordmotion'            " better word motions
call plug#end()








let mapleader = " "

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
let g:strip_whitespace_on_save  = 1
let g:strip_whitespace_confirm  = 0

" rainbow parentheses
let g:rainbow_active    = 1
" disable parentheses highlighting
let g:loaded_matchparen = 1

" fzf
noremap <leader>ff :Files<CR>
nnoremap <leader>fr :RG<CR>
" buffer navigation
noremap <leader>bb :Buffers<CR>
noremap <leader>b[ :bp<CR>
noremap <leader>b] :bn<CR>
noremap <leader>bd :bd<CR>

" airline
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter     = 'unique_tail'
let g:airline_section_y                        = ''
let g:airline_section_z                        = ''

