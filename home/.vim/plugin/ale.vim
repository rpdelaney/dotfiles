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
    \ 'command': 'ruff --config ~/.config/ruff/pyproject.toml fix %',
    \ 'read_temporary_file': 1,
    \ }
endfunction

call ale#fix#registry#Add('python', 'RuffFixer', ['python'], 'ruff for python')
