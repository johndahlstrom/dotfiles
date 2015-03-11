" Vim colorscheme template file
" Author: John Dahlström <john@johndahlstrom.se>
" Maintainer: John Dahlström <john@johndahlstrom.se>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
set background=dark
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="arthur"



"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=253    ctermbg=234 cterm=none
hi Cursor          ctermfg=255    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=237    cterm=none
hi LineNr          ctermfg=240    ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=108    ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=255    ctermbg=240    cterm=none
hi IncSearch       ctermfg=255    ctermbg=240    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=255    ctermbg=236    cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=none    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=234    ctermbg=108    cterm=none
hi Visual         ctermfg=255    ctermbg=237    cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none

hi Todo            ctermfg=255    ctermbg=237    cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=160    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=160   ctermbg=none    cterm=none
hi WarningMsg      ctermfg=160   ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=160   ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=255    ctermbg=none    cterm=none
hi String          ctermfg=180    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=167    ctermbg=none    cterm=none
hi Character       ctermfg=167    ctermbg=none    cterm=none
hi Number          ctermfg=167    ctermbg=none    cterm=none
hi Boolean         ctermfg=167    ctermbg=none    cterm=none
hi Float           ctermfg=167    ctermbg=none    cterm=none

hi Identifier      ctermfg=108    ctermbg=none    cterm=none
hi Function        ctermfg=167    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=167    ctermbg=none    cterm=none
hi Conditional     ctermfg=167    ctermbg=none    cterm=none
hi Repeat          ctermfg=167   ctermbg=none    cterm=none
hi Label           ctermfg=167   ctermbg=none    cterm=none
hi Operator        ctermfg=167   ctermbg=none    cterm=none
hi Keyword         ctermfg=167   ctermbg=none    cterm=none
hi Exception       ctermfg=167   ctermbg=none    cterm=none
hi Comment         ctermfg=241   ctermbg=none    cterm=none

hi Special         ctermfg=167   ctermbg=none    cterm=none
hi SpecialChar     ctermfg=167   ctermbg=none    cterm=none
hi Tag             ctermfg=167   ctermbg=none    cterm=none
hi Delimiter       ctermfg=255   ctermbg=none    cterm=none
hi SpecialComment  ctermfg=167   ctermbg=none    cterm=none
hi Debug           ctermfg=167   ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=108    ctermbg=none    cterm=none
hi Include         ctermfg=108    ctermbg=none    cterm=none
hi Define          ctermfg=108    ctermbg=none    cterm=none
hi Macro           ctermfg=108    ctermbg=none    cterm=none
hi PreCondit       ctermfg=108    ctermbg=none    cterm=none

hi Type            ctermfg=108    ctermbg=none    cterm=none
hi StorageClass    ctermfg=108    ctermbg=none    cterm=none
hi Structure       ctermfg=108    ctermbg=none    cterm=none
hi Typedef         ctermfg=108    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=108    ctermbg=none    cterm=none
hi DiffChange      ctermfg=179    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=167    ctermbg=none    cterm=none
hi DiffText        ctermfg=255    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
