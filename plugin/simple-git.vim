" show git log for current file in preview window:
function! Gitlog(options)
	let tmpfile = tempname()
	execute ":!git log " . a:options . " % >" . tmpfile
	execute ":pedit! ".tmpfile
endfunction
nmap ,gl :call Gitlog("--decorate")<cr><cr>
nmap ,gp :call Gitlog("--decorate -p")<cr><cr>
