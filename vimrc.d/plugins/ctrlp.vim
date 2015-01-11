let g:ctrlp_reuse_window      = 'NERD_tree_2'
let g:ctrlp_switch_buffer     = 0
let g:ctrlp_map               = '<leader>cp'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height        = 10
let g:ctrlp_extensions        = ['tag', 'changes']
let g:ctrlp_show_hidden       = 1

nnoremap <leader>cb :CtrlPBuffer<cr>
nnoremap <leader>cc :CtrlPChange<cr>
