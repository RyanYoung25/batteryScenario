" ---------------------------------------------------------------
" VIM Syntax file for Action languages
"
" Far from perfect but it let me do what I needed to do.
"
"
" Author: Ryan Young
" Date: 25-10-2016
" ---------------------------------------------------------------

if version < 600
   syntax clear
elseif exists("b:current_syntax")
  finish
endif

" PATTERN MATCHING

syn match fluent '[a-z0-9]\+[0-9a-zA-Z]*' 
syn region atom_brackets start='(' end=')' transparent contains=predicate_term, action_term


syn match predicate_term contained containedin=atom_brackets '[a-z0-9]\+[0-9a-zA-Z]*'

syn match action_term '[A-Z]\+[0-9a-zA-Z]*'

syn match action  '[A-Z]\+[0-9a-zA-Z]*'

syn match comment '%.*$'

syn keyword rule_keyword causes impossible if


" HIGHLIGHTING
highlight link comment               Comment
highlight link predicate_term        Type
highlight link action_term           Function
highlight link fluent                Statement
highlight link action                Function
highlight link rule_keyword          Keyword
