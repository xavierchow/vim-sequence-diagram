fun! vim_seq_diag#openurl(url) "{{{

  let cmd_browse = 'rundll32 url.dll,FileProtocolHandler '
  let url_pat = '\w\+:\/\{2}[^ ''()]\+'

  "TODO: match url with url_pattern..
  if a:url != ''
	let g:job = job_start(cmd_browse.a:url, {
				\ 'out_cb'  : function('helper#job_cb', ['helper#job_out_cb' , {} ]),
				\ 'exit_cb' : function('helper#job_cb', ['helper#job_exit_cb', {} ]),
				\ 'out_mode': 'raw'
				\})
  else
	echomsg 'sorry, no url found on this cursor''line'
  endif

endfunction "}}}
function! vim_seq_diag#Generate_diagram(pluginPath)
  let buf = getline(1, '$')
  "for substitute here needs 4 backslashs, but remember it's inside of double
  "quota string, so actually 8 backslashs literally
  call map(buf, 'substitute' . "(v:val, '\\', '\\\\\\\\', 'g')")
  call map(buf, 'substitute' . "(v:val, '`', '\\\\`', 'g')")

  let tmpl = a:pluginPath . '/tmpl.html'
  let tmpDir = expand("$tmp/vim-js-seq/")
  call mkdir(tmpDir, "p", 0777)
  " End 20190820 NIVA Fix tmpDir
  "TODO check file already exists?
  call system("cp " . a:pluginPath . '/underscore-min.js' . " " . tmpDir)
  call system("cp " . a:pluginPath . '/raphael-min.js' . " " . tmpDir)
  call system("cp " . a:pluginPath . '/sequence-diagram-min.js' . " " . tmpDir)
  call system("cp " . a:pluginPath . '/browser.min.js' . " " . tmpDir)

  let out = tmpDir . "out.html"
  call system("cp " . tmpl . " " . out)

  let originTab = tabpagenr()
  execute "tabe " . out
  "append the theme first to avoid the position of placeholder changes
  if g:generate_diagram_theme_hand == 1
    call append(17, ["'hand'"])
  else
    call append(17, ["'simple'"])
  endif

  call append(15, buf)
  silent :w!
  :bd
  execute "tabn " . originTab 

  if has('mac')
    call system("osascript " . a:pluginPath . '/applescript/active.scpt')
  else
  	call vim_seq_diag#openurl(out)
    " call system("xdg-open " . out)
  endif
endfunction

