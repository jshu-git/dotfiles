" yank to system clipboard
nnoremap y "+y
xnoremap y "+y

" yank to end of line
nnoremap Y y$

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

" enter for empty line below
nnoremap <CR> o<Esc>

" move to beginning/end of line
map L $
map H 0

" move 6 lines up/down
map K 6k
map J 6j

" map j and k to - and +
nnoremap j +
nnoremap k -

" repeat visual line/block to select more
xnoremap V j
xnoremap <C-v> j

" change word
nnoremap S ciw

" delete word
nnoremap X daw

" delete backwards
nnoremap <bs> X

" move one character to the left/right in insert mode
inoremap ll <right>
inoremap hh <left>





" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
