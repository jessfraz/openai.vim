if exists('g:autoloaded_openai')
	finish
endif
let g:autoloaded_openai = 1

" OpenAIComplete takes in either the visual selection of text or the line the
" cursor is currently on (if there is no visual selection) and appends the
" completed text from the OpenAI API.
function! openai#Complete()
	" Get the position of the cursor, if it is the start of the file we want
	" a different behavior than if it is elsewhere.
	let end_line = getpos("'>'")[1]
	let text = GetVisualSelection()
	if len(text) < 1
		" Get the current line instead.
		let end_line = getpos(".")[1]
		let text = getline(".")
	endif
	if len(text) < 1
		echohl Error
		echom "Must have text selected or have cursor on a line of text."
		echohl None
		return
	endif

	" Curl the OpenAI API and pipe the result to jq.
	" TODO: Update this URL and jq pipe when we know it.
	let output = trim(system("curl -s -u :${OPENAI_API_KEY}" https://api.openai.com/))

	" Append the text back to the selection or current line
	call append(end_line, split(output, "\n"))
endfunction

" GetVisualSelection returns the text in a visual selection.
function! GetVisualSelection()
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfunction
