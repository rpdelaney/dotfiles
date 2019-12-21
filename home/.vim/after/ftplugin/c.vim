setlocal foldmethod=marker shiftwidth=4 noexpandtab softtabstop=4
let &l:comments = 'sO:* -,mO:*  ,exO:*/,s0:/*,mb:**,ex:*/,://' " C comment style enforced by the 42 school
let b:ale_linters = {'c': ['gcc', 'clang']}
let l:ale_c_gcc_options = '-Wall -Werror -Wextra'
