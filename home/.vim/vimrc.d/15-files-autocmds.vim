if has("autocmd")
    " Enable file type detection
  filetype on
    " github issues
  autocmd BufNewFile,BufRead ISSUE_EDITMSG setlocal filetype=markdown
    " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
    " Treat document formats as zip files
    " TODO: this doesn't really work
  " au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand(""))
  " au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand(""))
endif

" vim600: set foldmethod=marker foldlevel=0 expandtab tabstop=2:
