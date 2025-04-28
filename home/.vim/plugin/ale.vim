" Set underline style for ALE errors with true color
highlight ALEError cterm=underline gui=underline guisp=#FF00FF " Red color

" Set underline style for ALE warnings with true color
highlight ALEWarning cterm=underline gui=underline guisp=#FFFF00 " Yellow color


" Markdown """""""""""""""""""""""""""""""""""
function! FixMarkdown(buffer) abort
  let cmd = 'mdformat -'
  let input = join(getline(1, '$'), "\n")
  let output = systemlist(cmd, input)
  return output
endfunction

call ale#fix#registry#Add('markdown', 'FixMarkdown', ['markdown'], 'mdformat for markdown')
