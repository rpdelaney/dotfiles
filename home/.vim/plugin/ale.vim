" Markdown """""""""""""""""""""""""""""""""""
function! FixMarkdown(buffer) abort
  let cmd = 'mdformat -'
  let input = join(getline(1, '$'), "\n")
  let output = systemlist(cmd, input)
  return output
endfunction

call ale#fix#registry#Add('markdown', 'FixMarkdown', ['markdown'], 'mdformat for markdown')
