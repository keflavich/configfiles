colorscheme elflord
set nostartofline
set ignorecase
set nowrap
set ruler
set hlsearch
syntax on
set vb t_vb=
set bs=2
set history=1000
set autoindent
set popt=duplex:long,syntax:y
set dir=/Users/adam/Documents
set formatoptions=trocql
set shiftwidth=4
set expandtab " use spaces in place of tabs.
set tabstop=4 " number of spaces for a tab.
set softtabstop=4 " number of spaces for a tab in editing operations.

"#IDL stuff
":source ~/.vim/idl.vim

"#Latex-Suite
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
helptags ~/.vim/doc

"# Adam Added 5/7/07
"noremap y "+y
map :W :w
nnoremap <S-Right> gt
nnoremap <S-Left> gT
map  :w
"map  ^
map  $

"added 10/6/07
set number

"added 12/7/07
set softtabstop=4
inoremap # X#

"added 3/12/08: switch <F9> to <F7> because of Mac F9 behavior
inoremap <silent> <Plug>Tex_Completion <Esc>:call Tex_Complete("default","text")<CR>
imap <buffer> <silent> <F7> <Plug>Tex_Completion 

"added 6/23/08: don't jump to error window
let g:Tex_ViewRule_pdf='/Applications/Adobe Reader 8/Adobe Reader.app/Contents/MacOS/AdobeReader'      
let g:Tex_GotoError = 0
let g:Imap_UsePlaceHolders = 0
let g:tex_flavor='latex'

"added 6/24/08:
set comments+=b:;
"set textwidth=80

"added 7/18/08:
"vimtips #64 - make current buffer CWD
function! CHANGE_CURR_DIR()
"    let _dir = expand("%:p:h")
"    exec "cd " . _dir
    exec "cd %:p:h"
"    unlet _dir
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()
" end vimtips 64

"map ,v :sp $VIMRC<CR><C-W>_
"map <silent> ,V :source $VIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


map <S-Tab> :call NextField(' \{2,}',2,' ',0)<CR>
map! <S-Tab> <C-O>:call NextField(' \{2,}',2,' ',0)<CR> 


" Call the PyIndentAutoCfg function.  Uncomment this line if you've copied
" this script in the python.vim syntax file or something like that.
call PyIndentAutoCfg()


" added 12/12/08
" VIM GREP -> ACK
" from http://use.perl.org/~Ovid/journal/36430
noremap <silent> <leader>g :call MyGrep("lib/")<cr>
noremap <silent> <leader>G :call MyGrep("lib/ t/ aggtests/ deps_patched/")<cr>
noremap <silent> <leader>f :call MyGrep("lib/", expand('<cword>'))<cr>

set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set guioptions-=T
