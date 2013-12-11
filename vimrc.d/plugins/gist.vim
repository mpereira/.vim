if system('uname -s') == "Linux\n"
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif system('uname -s') == "Darwin\n"
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 0
