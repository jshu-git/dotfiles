" yank to system clipboard
nnoremap y "+y
vnoremap y "+y
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
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

""" movement """
" disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" move to beginning/end of line
map L $
map H 0
" move 5 lines up/down
map K 5k
map J 5j
" map j and k to - and +
nnoremap j +
nnoremap k -
