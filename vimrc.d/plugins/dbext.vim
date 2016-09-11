let g:dbext_default_buffer_lines          = 15
let g:dbext_default_history_size          = 1000
let g:dbext_default_prompt_for_parameters = 1
let g:dbext_default_usermaps              = 0

" Execute SQL visually selected
vnoremap <unique> <localleader>se :DBExecVisualSQL<cr>

" SELECT * FROM the table visually selected.
vnoremap <unique> <leader>st :DBSelectFromTable<cr>

" Describe the table visually selected.
vnoremap <unique> <localleader>sdt :DBDescribeTable<cr>

" Display a list of tables with a specified prefix.
vnoremap <unique> <localleader>slt :DBListTable<cr>

" Display a list of columns for a given table.
vnoremap <unique> <localleader>slc :DBListColumn<cr>

" Execute SQL query under cursor.
nnoremap <unique> <localleader>se :DBExecSQLUnderCursor<cr>

" Execute SQL query under cursor prompting the user for how many rows to return
" from the result set.
nnoremap <unique> <localleader>sE :DBExecSQLTopX<cr>

" Execute all lines.
nnoremap <unique> <localleader>sea :1,$DBExecRangeSQL<cr>

" Execute the current line.
nnoremap <unique> <localleader>sel :.,.DBExecRangeSQL<cr>

" SELECT * FROM the table under the cursor.
nnoremap <unique> <localleader>st :DBSelectFromTable<cr>

" SELECT * FROM the table under the cursor prompting the user for how many rows
" to return.
nnoremap <unique> <localleader>sT :DBSelectFromTableTopX<cr>

" Ask for the table name and SELECT * FROM it.
nnoremap <unique> <localleader>sta :DBSelectFromTableAskName<cr>

" Describe the table under the cursor.
nnoremap <unique> <localleader>sdt :DBDescribeTable<cr>

" Describe the table prompt for the name.
nnoremap <unique> <localleader>sda :DBDescribeTableAskName<cr>

" Display a list of tables with a specified prefix
nnoremap <unique> <localleader>slt :DBListTable<cr>

" Display a list of columns for a given table.
nnoremap <unique> <localleader>slc :DBListColumn<cr>

" Display a list of all buffer specific SQL variables.
"
" Assigns a buffer SQL variable
" :DBSetVar set @var1 = '3'
" Removes a buffer SQL variable
" :DBSetVar set @var1 =
nnoremap <unique> <localleader>slv :DBListVar<cr>

" Opens the result window and displays a numbered list of previous SQL
" statements.  Pressing <enter> or double clicking on a SQL statement will
" execute the SQL.
nnoremap <unique> <localleader>sH :DBHistory<cr>
