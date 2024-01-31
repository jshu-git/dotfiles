set nocompatible

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

" add line above/below
nnoremap <CR> o<Esc>O<Esc>

" move to beginning/end of line
map L $
map H ^"0

" move 6 lines up/down
map K 6k
map J 6j

" better movement
nnoremap j gj
nnoremap k gk

" repeat visual line/block to select more
xnoremap V j
xnoremap <C-v> j

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
xnoremap <up> <nop>
xnoremap <down> <nop>
xnoremap <left> <nop>
xnoremap <right> <nop>

" leader mappings
" vim-indent-object plugin
nnoremap <leader>i vii
nnoremap <leader>I vai

" copy under
nnoremap <leader>y "+yG

" unintuitive mappings but very useful
" change word
nnoremap S ciw
" nnoremap <leader>c ciw

" delete word
nnoremap X daw
" nnoremap <leader>d daw
