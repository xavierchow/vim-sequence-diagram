" Vim plugin file for rendering
" js-sequence-diagram(https://bramp.github.io/js-sequence-diagrams/)
"
" Maintainer:	Xavier Chow <xiayezhou at gmail dot com>
" Last change:	Apr 08 2016
" Version:     0.1.0

if exists( "g:generate_diagram" ) 
  finish 
endif 
let g:generate_diagram=1 

let current_script_path = resolve(expand('<sfile>:p:h'))
"default nmap is <leader>t
if ( !hasmapto( '<Plug>GenerateDiagram', 'n' ) ) 
  nmap <unique> <leader>t <Plug>GenerateDiagram 
endif 
autocmd FileType sequence nmap <silent> <buffer> <Plug>GenerateDiagram
      \ :call vim_seq_diag#Generate_diagram(current_script_path)<CR>

if !exists("g:generate_diagram_theme_hand")
  let g:generate_diagram_theme_hand = 0
endif


