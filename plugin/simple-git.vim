function! s:SendCmdToPreview(cmd)
	let tmpfile = tempname()
	silent execute ":!" . a:cmd . " >" . tmpfile
	silent execute ":pedit! ".tmpfile
	redraw!
endfunction

function! s:Gitlog(options)
	call s:SendCmdToPreview( "git log " . a:options . " %" )
endfunction

function! s:Gitdiff(options)
	call s:SendCmdToPreview( "git diff " . a:options )
endfunction

function! s:Gitstatus()
	call s:SendCmdToPreview( "git status" )
endfunction

command! -nargs=* Gitlog  call s:Gitlog(<q-args>)
command! -nargs=* Gitdiff call s:Gitdiff(<q-args>)
command! Gitstatus call s:Gitstatus()

nmap ,gd :Gitdiff<CR>
nmap ,gm :Gitdiff origin/master..<CR>
nmap ,gl :Gitlog --decorate<CR>
nmap ,gp :Gitlog --decorate -p<CR>
nmap ,gs :Gitstatus<CR>
