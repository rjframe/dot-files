" Vim syntax file
" Language:	SDLang
" Maintainer: Arav Khanna <araspik@protonmail.com>
" Last Change: 2018 September 16 (2018-09-16)
" Links: https://sdlang.org
" Remarks: Layout based on asm.vim from NeoVim v0.3.0 release

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

" tags
" BUG: Matches Boolean types as well
syn match sdlangTag /"\@![a-z][a-zA-Z._]\+"\@!/
high def link sdlangTag Identifier

" numbers
syn match sdlangNum /[+-]\?\d\+\(L\|BD\)\?/
high def link sdlangNum Number
syn match sdlangFloat /[+-]\?\d\+\.\d\+f\?/
high def link sdlangFloat Float

" boolean
" BUG: Currently overriden by sdlangTag
syn match sdlangBool /\(true\|false\|on\|off\|null\)/
high def link sdlangBool Boolean

" date/time and duration
syn match sdlangDate /\d\{4}\/\d\{2}\/\d\{2}/ nextgroup=sdlangTime skipwhite
syn match sdlangTime /\d\{2}\:\d\{2}\:\d\{2}\.\d\{3}\(-UTC\)\?/
syn match sdlangDuration /\(\d\+d:\)\?\d\{2}\:\d\{2}\:\d\{2}\(\.\d\{3}\)\?/
high def link sdlangDate Constant
high def link sdlangTime Constant
high def link sdlangDuration Constant

" base64 data
syn match sdlangBase64 /\[[a-zA-Z0-9+/]*\]/
high def link sdlangBase64 Constant

" strings
syn match sdlangString /\\\@!".*[^\\]"/
syn match sdlangString /`[^`]*`/
high def link sdlangString String

" generic value type - contains all of the above
syn cluster sdlangValue contains=sdlangNum,sdlangFloat,sdlangString,sdlangBool,sdlangDate,sdlangTime,sdlangDuration,sdlangBase64

" comments
syn keyword sdlangTodo contained TODO
syn match sdlangComment /\/\/.*$/ contains=sdlangTodo
syn match sdlangComment /--.*$/ contains=sdlangTodo
syn match sdlangComment /#.*$/ contains=sdlangTodo
syn match sdlangComment /\/\*\_.\{-}\*\// contains=sdlangTodo

" attributes
syn match sdlangAttribute /"\@![a-z][a-zA-Z._]\+"\@!=/ nextgroup=sdlangValue

let b:current_syntax = "sdlang"

" vim: ts=4
