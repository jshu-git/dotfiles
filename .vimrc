" https://github.com/vim/vim/blob/master/runtime/defaults.vimset backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=200
set mouse=a                    " enable mouse support
set nocompatible
set nrformats-=octal           " don't recognize octal for C-a and C-x
set ruler
set showcmd                    " display incomplete commands
set ttimeout                   " timeout for key codes
set ttimeoutlen=100            " wait up to 100ms after Esc fo  special key
set wildmenu                   " display completion matches in a status line
syntax on

" https://old.reddit.com/r/vim/comments/11ntbmv/whats_your_vimrc_setup_for_2023/
filetype on
set autoindent
set expandtab    " use spaces instead of tabs
set hidden
set hlsearch     " highlight search results
set nobackup
set noswapfile
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set background=dark
set laststatus=2 " always show status line
set noshowmode   " don't show mode as lightline already does
set updatetime=100
set splitbelow   " automatically focus new window splits
set splitright
set ignorecase

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
Plug 'EdenEast/nightfox.nvim'            " https://github.com/EdenEast/nightfox.nvim
Plug 'airblade/vim-gitgutter'            " https://github.com/airblade/vim-gitgutter
Plug 'christoomey/vim-sort-motion'       " https://github.com/christoomey/vim-sort-motion
Plug 'dhruvasagar/vim-zoom'              " https://github.com/dhruvasagar/vim-zoom
Plug 'github/copilot.vim'                " https://github.com/github/copilot.vim
Plug 'jeffkreeftmeijer/vim-numbertoggle' " https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                  " https://github.com/junegunn/fzf.vim
Plug 'junegunn/vim-easy-align'           " https://github.com/junegunn/vim-easy-align
Plug 'luochen1990/rainbow'               " https://github.com/luochen1990/rainbow
Plug 'machakann/vim-highlightedyank'     " https://github.com/machakann/vim-highlightedyank
Plug 'ntpeters/vim-better-whitespace'    " https://github.com/ntpeters/vim-better-whitespace
Plug 'romainl/vim-cool'                  " https://github.com/romainl/vim-cool
Plug 'tpope/vim-commentary'              " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-endwise'                 " https://github.com/tpope/vim-endwise
Plug 'tpope/vim-surround'                " https://github.com/tpope/vim-surround
Plug 'vim-airline/vim-airline'           " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'                " https://github.com/wellle/targets.vim
Plug 'yggdroot/indentline'               " https://github.com/yggdroot/indentline
Plug 'mg979/vim-visual-multi'            " https://github.com/mg979/vim-visual-multi
call plug#end()

colorscheme nightfox






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
nmap <leader>Y "+Y
" yank to system clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y

" undo
noremap U <C-r>

" indent/outdent with tab/shift-tab and keep selected
nnoremap <Tab> >>
nnoremap <S-Tab> <<
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" add line below
nnoremap <CR> o<Esc>

" paste without changing the default register
xnoremap p "_dP
" format pasted line
nnoremap p p==

" fast save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
" fast reload
noremap <C-r> :source $MYVIMRC<CR>
" fast quit
noremap <leader>q :q<CR>
" fast buffer close
noremap <leader>d :bd<CR>

" better movement
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
map L g$
map H ^"0
" move 6 lines up/down
map K 6k
map J 6j
" center cursor
noremap n nzz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap { {zz
noremap } }zz

" backspace delete backwards
nnoremap <bs> X
" cw 'standard' behavior https://stackoverflow.com/a/41793667
nnoremap cw dwi
nnoremap cW dWi
" change word
nmap s ciw
nmap S caw
" delete word
nmap X daw
" delete to black hole register
nnoremap x "_x
xnoremap x "_x

" insert mode mappings
" move to end of word
inoremap <C-f> <Esc>ea
" move to beginning of word
inoremap <C-b> <Esc>bi
" move one character to the left/right in insert mode
inoremap ll <right>
inoremap hh <left>

" window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-\> :vsplit<CR>
noremap <C--> :split<CR>
" window resizing
noremap <C-Right> 4<C-w><
noremap <C-Left> 4<C-w>>
noremap <C-Up> 4<C-w>+
noremap <C-Down> 4<C-w>-






" plugins
" commenting
nmap <C-c> gcc
xmap <C-c> gc

" easy align
map ga <Plug>(EasyAlign)

" fzf
noremap <leader>ff :Files<CR>
noremap <leader>fr :RG<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>fw :Windows<CR>
noremap <leader>fm :Maps<CR>
" buffer navigation
noremap <leader>b :Buffers<CR>
noremap <C-]> :bnext<CR>
noremap <C-[> :bprev<CR>

" copilot
" ctrl+space
nnoremap <C-@> :Copilot panel<CR>
inoremap <C-@> <Esc>:Copilot panel<CR>

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

" vim-cool
let g:cool_total_matches = 1

" indentline
let g:indentLine_char    = '▏'
let g:indentLine_enabled = 1

" airline
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#formatter     = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_theme                            = 'minimalist'
let g:airline_section_z                        = ''
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
\ }


" gitgutter
highlight! link SignColumn LineNr

" no more auto commenting https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
au FileType * set fo-=c fo-=r fo-=o

