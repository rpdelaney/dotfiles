let g:ale_sign_error = '❗'
let g:ale_sign_warning = '❔'
let g:ale_echo_msg_info_str='I'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str="W"
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_priority = 30
let g:ale_shell = "bash"
let g:ale_shell_arguments = "--norc --noprofile -c"

" Markdown """""""""""""""""""""""""""""""""""
function! FixMarkdown(buffer) abort
  let cmd = 'mdformat -'
  let input = join(getline(1, '$'), "\n")
  let output = systemlist(cmd, input)
  return output
endfunction

call ale#fix#registry#Add('markdown', 'FixMarkdown', ['markdown'], 'mdformat for markdown')
