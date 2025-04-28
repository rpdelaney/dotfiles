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

" python-ruff """""""""""""""""""""""""""""""""""
function! RuffFixer(buffer) abort
  return {
    \ 'command': 'ruff fix --fix-only --show-fixes %',
    \ 'read_temporary_file': 1,
    \ }
endfunction

call ale#fix#registry#Add('python', 'RuffFixer', ['python'], 'ruff for python')
