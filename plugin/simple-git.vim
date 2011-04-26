" show git log for current file in preview window:
function! s:SendCmdToPreview(cmd)
	let tmpfile = tempname()
	silent execute ":!" . a:cmd . " >" . tmpfile
	silent execute ":pedit! ".tmpfile
endfunction

function! s:Gitlog(options)
	call s:SendCmdToPreview( "git log " . a:options . " %" )
endfunction

function! s:Gitdiff(options)
	call s:SendCmdToPreview( "git diff " . a:options )
endfunction

command! -nargs=* Gitlog  call s:Gitlog(<q-args>)
command! -nargs=* Gitdiff call s:Gitdiff(<q-args>)

nmap ,gd :Gitdiff<CR>
nmap ,gm :Gitdiff origin/master..<CR>
nmap ,gl :Gitlog --decorate<CR>
nmap ,gp :Gitlog --decorate -p<CR>
