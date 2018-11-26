"""""""""""""""""""""""""""""""""""""""""""""""
" Vim config
"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""

"let g:pathogen_disabled = ['ultisnips']
execute pathogen#infect()

"set term=xterm-256color

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
let &colorcolumn="80".join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27


"""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""

let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_list_type = "quickfix"

let g:go_term_mode = 1

" build and run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>t :GoTest -nocolor<Cr>

augroup go
  autocmd!
  autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and Completion
"""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype indent plugin on

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

let g:deoplete#enable_at_startup = 1

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

" Color stuff
set t_Co=256

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" vim-airline configuration:
set laststatus=2

" update status line every 100ms
set updatetime=100

let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""

" leader key
let mapleader=','

" move lines
map <up> ddkP
map <down> ddjP

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" toggle between relative and absolute line numbers
nnoremap <C-k> :call NumberToggle()<cr>

" compile and run!
au FileType tex map <F10> :!make<cr>

map <F12> <ESC>ggg?G``" apply rot13 for people snooping over shoulder, good fun

" insert date
nmap <F2> i<C-R>=strftime("%Y-%m-%d %H:%M:%S %z")<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""""""""
" misceallaneous
"""""""""""""""""""""""""""""""""""""""""""""""
set nobackup

" Write file on :make
set autowrite

" Enable backspace between lines
set backspace=2

let g:Tex_PromptedEnvironments="itemize,align*,cases"
