"""""""""""""""""""""""""""""""""""""""""""""""
" Vim config
"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""
" line numbers and textwrapping
"""""""""""""""""""""""""""""""""""""""""""""""

" keep curser in the middle of the screen if possible
set scrolloff=999

" set relativenumber function mapped on ctrl-n (see section Key mappings)
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" initial line numbers
set number

" wrap text and show 80 char mark
set textwidth=80
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and Completion
"""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin indent on

let g:tex_flavor='latex'

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" Dont check java (it is very very very slow because it uses maven and javac)
" and assembler because armv6 is not supported
" Maybe try to find another syntax checker
let g:syntastic_mode_map = { "mode": "active",
                           \ "passive_filetypes": ["java", "asm"] }

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:syntastic_tex_chktex_args = "-n1"

"""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""
" Look
"""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline configuration:
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""

" move lines
map <up> ddkP
map <down> ddjP

" toggle between relative and absolute line numbers
nnoremap <C-n> :call NumberToggle()<cr>

" compile and run!
au FileType tex map <F10> :!make<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""
" misceallaneous
"""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
map <F12> <ESC>ggg?G``" apply rot13 for people snooping over shoulder, good fun



let g:Tex_PromptedEnvironments="itemize,align*,cases"
