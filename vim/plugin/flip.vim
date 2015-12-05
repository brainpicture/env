
function! FlipParams()
  let colNum = col(".")
  let l = getline(".")
  let st = strpart(l, 0, colNum)
  let end = strpart(l, colNum)
  let leftComma =  match(st, ',[\^,]\*$')
  if (leftComma != -1)
    let leftComma = strlen(st) - leftComma;
  endif
  let rightComma = match(end, '^[\^,]\*,')
  "let paramidx = match(st, '[^(]\+$')
  echo [st, end, leftComma, rightComma]
endfunction

command! Flip call FlipParams()
