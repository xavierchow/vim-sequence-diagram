if exists("b:sequence_syntax")
  finish
endif
let b:sequence_syntax = 1

syntax match seqKeyword /\cnote right of/
syntax match seqKeyword /\cnote left of/
syntax match seqKeyword /\cnote over/
syntax match seqKeyword /\ctitle/
syntax match seqOperator /->/
syntax match seqOperator /-->/
syntax match seqOperator /->>/
syntax match seqOperator /-->>/
syntax region seqString matchgroup=Special start=/\v:\s/ end=/\v$/
highlight link seqKeyword Keyword
highlight link seqOperator Operator
highlight link seqString String
