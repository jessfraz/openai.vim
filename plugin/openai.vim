" Track that the plugin was loaded.
if exists('g:loaded_openai')
  finish
endif
let g:loaded_openai = 1

" Map <leader>o to openai#Complete.
nnoremap <leader>o :call openai#Complete()<CR>

command! -nargs=0 OpenAIComplete call openai#Complete()
