"this should override the terminal settings...
highlight Normal ctermfg=White ctermbg=Black

"http://vim.wikia.com/wiki/Backspace_and_delete_problems
"Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete
"over line breaks, or automatically-inserted indentation, or the place 
"where insert mode started:
"This is only happening in cygwin, so far...
set backspace=2 " make backspace work like most other apps
"Alternately, add this to your .vimrc:
"set backspace=indent,eol,start

syntax on " syntax hilighting
set background=dark " bold syntax
set nu " line numbers
set numberwidth=5
set ru " show cursor position in status line!


"set cursorline "underline the current line... may slow redraw

" unfortunately, these colors may differ on different environments
"highlight StatusLine   ctermfg=4 
highlight StatusLineNC ctermfg=0 ctermbg=7

" cindent is set for *all* files...
" Might be wiser to use: :filetype indent on
" DEFINITELY see usr_30.txt
" and /usr/share/vim/vim72/indent/*
" And usr_29 for code-browsing stuff like how to find the end of an #ifdef
set cindent " use auto-indent for c files
"Notes re tabstop, etc... see help tabstop for more
" softtabstop doesn't sound right 'a mix of spaces and tabs'
" tabstop doesn't sound right: 'any other value than 8 can make your file 
"   appear wrong in many places'
" expandtab sounds feasible... 'insert a real tab with CTRL-V<Tab>'
"   it *does* align columns
"   but the spaces aren't realigned if data before-hand changes
"   (e.g. 'asd<tab>asdf'
"      -> changing 'asd' to 'asdb' messes up asdf's alignment"
"   (alone anyways) backspace deletes individual spaces
" smarttab might want to look into...
" SEE ALSO help ins-expandtab which has a better explanation of these
"   options
" (Losing steam, gonna just leave it as-was)

"THESE NOTES from polled_uat.h v0.76:
"//0.76 Experimenting with VIM's retab
"//   I use 3 spaces for a tab
"//   From: http://vim.wikia.com/wiki/Converting_tabs_to_spaces
"//      :set expandtab // each 'tab' press will insert spaces 
"//                     // (CTRL-V<Tab> inserts a real one)
"//      :set tabstop=3 // has been for years, tabs wil be 3 spaces
"//      :set shiftwidth=3 // auto-indentation
"//      :retab         // replaces existing tab characters with spaces
"//     (:set softtabstop //allegedly causes <Tab> and <Backspace> to
"//                       //insert and delete tabstop spaces
"//                       //I've never had any luck with this, and the
"//                       //manual makes it sound like it's sorta mutually-
"//                       //exclusive, as I recall)
set sw=3 "shiftwidth for auto-indent
set ts=3 " tabstop... (might not be necessary with above)
"set smarttab
"This Added a/o polled_uat.h 0.76
set expandtab
"Didn't see this until quite a bit later:
"//NOTE: typing ':retab' does NOT retabulate makefiles, good.
autocmd FileType make setlocal noexpandtab


set title " Allow vim to adjust the window title
set columns=80
set laststatus=2 "show a status-line (the black bar at the bottom)

"set foldmethod=marker
set foldmarker={,}
highlight Folded ctermbg=yellow ctermfg=black

"Blue is damn-near impossible to read on black backgrounds
" Find a list of highlight colors by typing ':highlight'
" Find a list of colors using ':help cterm-colors'
highlight SpecialKey ctermbg=DarkBlue ctermfg=Yellow
"Apparently NonText is used for the empty (~) lines at the bottom of a file
highlight NonText ctermbg=DarkBlue ctermfg=Yellow
highlight PreProc cterm=Bold ctermbg=DarkBlue ctermfg=White
"Brown
highlight Underlined ctermbg=DarkBlue ctermfg=Yellow
"highlight Include -> PreProc
"highlight Define -> PreProc
"highlight Macro -> PreProc
"highlight PreCondit -> PreProc
"highlight cOctalZero -> PreProc
"highlight cPreCondit -> PreCondit
"highlight cInclude -> Include
"highlight cDefine -> Macro
"highlight cPreProc -> PreProc
"highlight helpSectionDelim -> PreProc
"helpHeader, and more... all linked somewhere above (or nested-linked)

"Also illegible are dark-gray...
highlight Ignore ctermbg=Blue ctermfg=DarkGray cterm=bold

"Use up and down to move within a wrapped-line: (see below)
" Apparently this only works in non-INSERT mode...
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj

"Reformat long lines when not in insert-mode by highlighting (type 'V') 
" then type 'gq'
set textwidth=75


"http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
"The command :set wrap lbr will wrap long lines between words.
"However, when you move the cursor down (or up), the cursor will jump from
"one physical line to the next. You can press j to move down one physical
"line, or gj to move down one displayed line.

"To make it easy, you could put the following in your vimrc file. Then
"press \w to toggle wrapping on or off (that's a backslash then w, assuming
"the default Leader key). When wrap is on, the cursor movement keys are
"mapped to move by display lines.

"noremap <silent> <Leader>w :call ToggleWrap()<CR>
"function ToggleWrap()
"  if &wrap
"    echo "Wrap OFF"
"    setlocal nowrap
"    set virtualedit=all
"    silent! nunmap <buffer> <Up>
"    silent! nunmap <buffer> <Down>
"    silent! nunmap <buffer> <Home>
"    silent! nunmap <buffer> <End>
"    silent! iunmap <buffer> <Up>
"    silent! iunmap <buffer> <Down>
"    silent! iunmap <buffer> <Home>
"    silent! iunmap <buffer> <End>
"  else
"    echo "Wrap ON"
"    setlocal wrap linebreak nolist
"    set virtualedit=
"    setlocal display+=lastline
"    noremap  <buffer> <silent> <Up>   gk
"    noremap  <buffer> <silent> <Down> gj
"    noremap  <buffer> <silent> <Home> g<Home>
"    noremap  <buffer> <silent> <End>  g<End>
"    inoremap <buffer> <silent> <Up>   <C-o>gk
"    inoremap <buffer> <silent> <Down> <C-o>gj
"    inoremap <buffer> <silent> <Home> <C-o>g<Home>
"    inoremap <buffer> <silent> <End>  <C-o>g<End>
"  endif
"endfunction
