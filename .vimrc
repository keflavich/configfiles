
if match($TERM, "xterm-256color")!=-1
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    set term=xterm-256color
endif
    

" nocp disables history and other commands
set nocp
colorscheme elflord
set nostartofline
set ignorecase
set smartcase " 1/19/2012 - case-sensitive if caps
set nowrap
set ruler
set hlsearch
syntax on
set vb t_vb=   " When no beep or flash is wanted, use ":set vb t_vb=".
set bs=2
set autoindent
set popt=duplex:long,syntax:y
set dir=/Users/adam/Documents
set formatoptions=trocql
set shiftwidth=4 " applies to >>, etc.
set expandtab " use spaces in place of tabs.
set tabstop=4 " number of spaces for a tab.
set softtabstop=4 " number of spaces for a tab in editing operations.
set is " search as you type
set autoread " auto-reload
"set scrollbind  " not on by default because can be annoying
set history=10000

" buffers in the background remain open (useful for cmd line)
set hidden

" added 10/30/2012
" suffixes to put to the end of the list when completing file names
set suffixes=.log,.bak,~,.o,.h,.info,.swp,.aux,.swo,.bbl,.blg,.pdf
set wildignore=*.aux,*.pdf,*.blg,*.fits,*.png

 
 
" Python autocomplete (added 10/31/2012)
" http://www.vim.org/scripts/script.php?script_id=850
let g:pydiction_location = '/Users/adam/.vim/pydiction-1.2/complete-dict'

" Found 1/12/2012: http://stackoverflow.com/questions/3607516/vim-folding-messes-up-syntax-highlighting
":syn sync fromstart  
" Maybe fixes python triple quote issues?

"#IDL stuff
":source ~/.vim/idl.vim

" (1/19/2012 from http://superuser.com/questions/323365/are-vimrc-and-viminfo-the-same-files-but-with-different-names)
" Don't use Ex mode, use Q for formatting
map Q gq

" 1/27/2012 http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=DarkGray ctermfg=White guibg=#333333
match OverLength /\%81v.\+/
 

" 1/19/2012 http://items.sjbach.com/319/configuring-vim-right
" match if/else with %
runtime macros/matchit.vim
" tab completion... wow I missed this
set wildmenu
"set title " change terminal title?

" WHOA: http://briancarper.net/blog/448/vim-regexes-are-awesome
" (this stuff is 1/19/2012 too) http://briancarper.net/blog/376/stupid-vim-trick-and-mental-illness
" Heh - these two commands add a timestamp to ~/timestamps_vim_write every time I hit :w
"cabbrev w <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'W' : 'w')<CR>
"command! -nargs=* W :execute("silent !echo " . strftime("%Y-%m-%d %H:%M:%S") . " >> ~/timestamps_vim_write")|w <args>

" 1/19/2012 http://www.vim.org/scripts/script.php?script_id=2332
"call pathogen#infect() 
" http://stackoverflow.com/questions/3383502/pathogen-does-not-load-plugins
"call pathogen#runtime_append_all_bundles() 

" this should not be necessary
source ~/.vim/plugin/WhichTab.vim


"remote keyboard issues (from lappy):
map OH ^
map OF $

"#Latex-Suite
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
helptags ~/.vim/doc

"http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" from the same wikia post
command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)
command! -complete=file -nargs=* Bzr call s:RunShellCommand('bzr '.<q-args>)
command! -complete=file -nargs=* Hg  call s:RunShellCommand('hg '.<q-args>)

"# Adam Added 5/7/07
"noremap y "+y
map :W :w
map :spellcheck :setlocal spell spelllang=en_us
nnoremap <S-Right> gt
nnoremap <S-Left> gT
map  :w
"map  ^
map  $

"added 10/6/07
set number

"added 12/7/07
set softtabstop=4
" this only applies if set smartindent
inoremap # X#
" When typing '#' as the first character in a new line, the indent for
" that line is removed, the '#' is put in the first column.  The indent
" is restored for the next line.  If you don't want this, use this
" mapping: ":inoremap # X^H#", where ^H is entered with CTRL-V CTRL-H.

"added 3/12/08: switch <F9> to <F7> because of Mac F9 behavior
inoremap <silent> <Plug>Tex_Completion <Esc>:call Tex_Complete("default","text")<CR>
imap <buffer> <silent> <F7> <Plug>Tex_Completion 

"added 6/23/08: don't jump to error window
"let g:Tex_ViewRule_pdf='/Applications/Adobe Reader 8/Adobe Reader.app/Contents/MacOS/AdobeReader'      
"let g:Tex_ViewRule_pdf='/Applications/Skim.app/Contents/SharedSupport/skimpdf'
let g:Tex_ViewRule_pdf='Skim'
let g:Tex_GotoError = 0
let g:Imap_UsePlaceHolders = 0
let g:tex_flavor='latex'
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""


"added 6/24/08:
set comments+=b:;
"set textwidth=80

"added 7/18/08:
"vimtips #64 - make current buffer CWD
" http://stackoverflow.com/questions/308452/vim-bufenter-autocmd-fails-on-ftp-files 
function! CHANGE_CURR_DIR()
"    let _dir = expand("%:p:h")
"    exec "cd " . _dir
    execute ":silent! cd %:p:h"
"    unlet _dir
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()
" end vimtips 64

"map ,v :sp $VIMRC<CR><C-W>_
"map <silent> ,V :source $VIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" function: NextField
" " Args: fieldsep,minlensep,padstr,offset
" "
" " NextField checks the line above for field separators and moves the cursor on
" " the current line to the next field. The default field separator is two or
" more
" " spaces. NextField also needs the minimum length of the field separator,
" " which is two in this case. If NextField is called on the first line or on a
" " line that does not have any field separators above it the function echoes an
" " error message and does nothing.
"
func! NextField(fieldsep,minlensep,padstr,offset)
		let curposn = col(".")
		let linenum = line(".")
		let prevline = getline(linenum-1)
		let curline = getline(linenum)
		let nextposn = matchend(prevline,a:fieldsep,curposn-a:minlensep)+1
		let padding = ""

    if nextposn > strlen(prevline) || linenum == 1 || nextposn == 0
			        echo "last field or no fields on line above"
					        return
						endif
							echo ""

				if nextposn > strlen(curline)
				if &modifiable == 0
					return
			endif
	let i = strlen(curline)
			while i < nextposn - 1
						let i = i + 1
	let padding = padding . a:padstr
			endwhile
call setline(linenum,substitute(curline,"$",padding,""))
endif
	call cursor(linenum,nextposn+a:offset)
return
endfunc 

map <S-Tab> :call NextField(' \{2,}',2,' ',0)<CR>
map! <S-Tab> <C-O>:call NextField(' \{2,}',2,' ',0)<CR> 

" Tip: set indent parameters for python files.
" Version: 0.1
" Date: 13 May 2006
"
" Description: most python scripts use four spaces for indenting, but
"              sometimes you will end up editing a script where tabs
"              are used; in these situations it can be useful to
"              automatically detect whether spaces or tabs were used,
"              and set some parameters (or call some functions) consequently.
"
" Usage: you can put this script in you vimrc and call the PyIndentAutoCfg
"        function with an autocmd associated to python files, or call
"        it manually, or put it in the python.vim syntax script, or... :-)

" Function to set parameters for python scripts that use
" spaces for indention.  This is also the default.  YMMV.
function! PySpacesCfg()
  setlocal expandtab " use spaces in place of tabs.
  setlocal tabstop=4 " number of spaces for a tab.
  setlocal softtabstop=4 " number of spaces for a tab in editing operations.
  setlocal shiftwidth=4 " number of spaces for indent (>>, <<, ...)
endfunction

" Function to set parameters for python scripts that use
" tabs for indention.  YMMV.
function! PyTabsCfg()
  setlocal noexpandtab
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
endfunction

" This function returns 1 if the file looks like a python script
" that uses tabs for indenting, or 0 otherwise.
function! PyIsTabIndent()
  let lnum = 1
  let max_lines = 100 " max number of lines to check.
  let got_tabs = 0
  let got_cols = 0 " 1 if the previous lines ended with columns.
  while lnum <= max_lines
    let line = getline(lnum)
    let lnum = lnum + 1
    if got_cols == 1
      if line =~ "^\t\t" " at least two tabs, to prevent false-positives.
        let got_tabs = 1
        break
      endif
    endif
    if line =~ ":\s*$"
      let got_cols = 1
    else
      let got_cols = 0
    endif
  endwhile

  return got_tabs
endfunction

" Check the file, and run the relative function.
function! PyIndentAutoCfg()
  if PyIsTabIndent() == 1
    call PyTabsCfg()
  else
    call PySpacesCfg()
  endif
endfunction

" Call the PyIndentAutoCfg function.  Uncomment this line if you've copied
" this script in the python.vim syntax file or something like that.
call PyIndentAutoCfg()


" added 12/12/08
" VIM GREP -> ACK
" from http://use.perl.org/~Ovid/journal/36430
noremap <silent> <leader>g :call MyGrep("lib/")<cr>
noremap <silent> <leader>G :call MyGrep("lib/ t/ aggtests/ deps_patched/")<cr>
noremap <silent> <leader>f :call MyGrep("lib/", expand('<cword>'))<cr>

function! MyGrep(paths, ...)
    let pattern = a:0 ? a:1 : input("Enter pattern to search for: ")

    if !strlen(pattern)
        return
    endif

    let command = 'ack "' . pattern . '" ' . a:paths .' -l'
    let bufname = bufname("%")
    let result  = filter(split( system(command), "\n" ), 'v:val != "'.bufname.'"')
    let lines   = []
    if !empty(result)
        if 1 == len(result)
            let file  = 1
        else

            " grab all the filenames, skipping the current file
            let lines = [ 'Choose a file to edit:' ]
                \ + map(range(1, len(result)), 'v:val .": ". result[v:val - 1]')
            let file  = inputlist(lines)
        end
        if
            \ ( file > 0 && len(result) > 1 && file < len(lines) )
            \ ||
            \ ( 1 == len(result) && 1 == file )
            execute "edit +1 " . result[ file - 1 ]
            execute "/\\v"  . pattern
        endif
    else
        echomsg("No files found matching pattern:  " . pattern)
    endif
endfunction



" removed because (probably?) unnecessary
" set shiftwidth=4
" set expandtab " use spaces in place of tabs.
" set tabstop=4 " number of spaces for a tab.
" set softtabstop=4 " number of spaces for a tab in editing operations.

autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map <Down> gj
autocmd BufRead *\.txt map <Up>   gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us
"F7 WordProcessorOn
:map <F7> :set linebreak <CR> :set display+=lastline <CR> :set wrap <CR> :setlocal spell spelllang=en_gb <CR> 
"F6 WordProcessorOff
:map <F6> :set nowrap <CR> :set nospell <CR> 
autocmd BufRead *\.txt imap <up> <C-O>gk
autocmd BufRead *\.txt imap <down> <C-O>gj
autocmd BufRead *\.txt nmap <up> gk
autocmd BufRead *\.txt nmap <down> gj
autocmd BufRead *\.txt vmap <up> gk
autocmd BufRead *\.txt vmap <down> gj
"autocmd BufRead *\.txt imap <home> <C-O>g^
"autocmd BufRead *\.txt imap <end> <C-O>g$
"autocmd BufRead *\.txt nmap <home> g^
"autocmd BufRead *\.txt nmap <end> g$
"autocmd BufRead *\.txt vmap <home> g^
"autocmd BufRead *\.txt vmap <end> g$
"autocmd BufRead *\.txt set wrap

" for html editing
" http://www.vim.org/scripts/script.php?script_id=1896 ->
" http://github.com/tpope/vim-ragtag
let g:ragtag_global_maps = 1 

" blogger:
" https://github.com/ujihisa/blogger.vim
let g:blogger_blogid = '4581210966774229205'
let g:blogger_email = 'keflavich@gmail.com'
"let g:blogger_pass = ''

" for vmail:
let g:vmail_flagged_color = "ctermfg=yellow ctermbg=black cterm=bold"

" netrw (editing remote files)
let g:netrw_silent=1

hi CursorLine   cterm=NONE guibg=NONE

" I think netrw overwrote this?
nnoremap <F5> :GundoToggle<CR>

"let g:jedi#squelch_py_warning=1



""LATEX maps
"""http://vim.1045645.n5.nabble.com/Compiling-LaTeX-within-vim-Two-Questions-td1169813.html
""map ,p :Shell pdflatex -interaction nonstopmode % 
""map ,b :Shell bibtex % 
"" Activate skim
"map ,v :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
"map ,p :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
"map ,m :w<CR>:silent !make <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
"" Reactivate VIM
"map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
"map ,t :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR><CR>
"" I don't think this one works... map ,t :w Shell pdflatex % & 

let g:macvim_skim_app_path='/Applications/Skim.app'

" per http://vim-taglist.sourceforge.net/faq.html; need exuberant not gnu
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" TagbarToggle!  As per sam's suggestion (3/1/2013)
nnoremap ,l :TagbarToggle<CR>


" http://stackoverflow.com/questions/15643837/vim-autoread-netrw-to-prevent-accidental-overwriting
:autocmd FocusGained ftp://*,scp://*,rsync://* nested
\   if ! &modified && ! exists('b:lastchecktime') || localtime() - b:lastchecktime > 300 |
\       edit |
\       let b:lastchecktime = localtime() |
\   endif

