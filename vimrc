"""""""""""""""""""""""""""""""""""""""""""""""
" Vim config
"""""""""""""""""""""""""""""""""""""""""""""""

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
"let &colorcolumn="80".join(range(81,999),",")
"highlight ColorColumn ctermbg=235 "guibg=#2c2d27


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

let g:go_metalinter_autosave = 0
let g:go_metalinter_command = "gopls"

let g:go_gopls_staticcheck = 1
let g:go_list_type = "quickfix"
let g:go_term_mode = 0

let g:go_snippet_engine = "neosnippet"

" build and run

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>t :GoTest<Cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""""""""""""""""""

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"""""""""""""""""""""""""""""""""""""""""""""""
" Look
"""""""""""""""""""""""""""""""""""""""""""""""

" Color stuff
"set t_Co=256

" This makes kitty work with vims background color erase
" see: https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
let &t_ut=''


"let g:rehash256 = 1
"let g:molokai_original = 1
colorscheme 256-jungle

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

