let g:ctrlp_reuse_window = 'NERD_tree_2'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10
let g:ctrlp_extensions = ['tag', 'changes']
let g:ctrlp_custom_ignore = 'node_modules$\|.DS_Store$\|.git$\|build$\|.log$'

nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>s :CtrlPChange<CR>
