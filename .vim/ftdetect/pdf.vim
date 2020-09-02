autocmd BufRead *.pdf set filetype=pdf

if executable('w3m') && executable('pdftoroff')
    autocmd BufReadCmd *.pdf silent %!pdftoroff -w "%" | w3m -dump -T text/html
endif
