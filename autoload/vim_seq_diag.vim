
function! vim_seq_diag#Generate_diagram(pluginPath)
  let buf = getline(1, '$')
  "for substitute here needs 4 backslashs, but remember it's inside of double
  "quota string, so actually 8 backslashs literally
  call map(buf, 'substitute' . "(v:val, '\\', '\\\\\\\\', 'g')")
  call map(buf, 'substitute' . "(v:val, '`', '\\\\`', 'g')")

  let tmpl = a:pluginPath . '/tmpl.html'
  let tmpDir = "/tmp/vim-js-seq/"
  call system("mkdir " . tmpDir)
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
    call system("xdg-open " . out)
  endif
endfunction

