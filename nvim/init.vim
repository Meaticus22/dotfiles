set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'sainnhe/sonokai'
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'spolu/dwm.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'junegunn/fzf.vim'
Plugin 'arakashic/chromatica.nvim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'zchee/deoplete-clang'
Plugin 'bubujka/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'ap/vim-css-color'
Plugin 'ervandew/supertab'
Plugin 'tribela/vim-transparent'
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plugin 'jparise/vim-graphql'        " GraphQL syntax
"PHIND PLUGINS"
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'terryma/vim-multiple-cursors'
" Add coc.nvim to your init.vim
Plugin 'neoclide/coc.nvim', {'branch': 'release'}



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap jk <Esc>
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <F1> :cprev<cr>
nnoremap <F2> :cnext<cr>
nnoremap <silent> <F3> :cclose\|cd %:h/..\|make!\|cd %:h\|copen\|redraw!<cr>:normal G<cr>
nnoremap <silent> <F4> :cclose\|cd %:h/..\|make!\|cd %:h\|redraw!<cr>
nmap <F8> :TagbarToggle<CR>
" nmap <F4> <Plug>LLBreakSwitch
" nnoremap <F5> :LLmode debug<CR>
" nnoremap <F6> :LL step<CR>
" nnoremap <F7> :LL next<CR>
" nnoremap <F8> :LL continue<CR>
" nnoremap <F9> :LL process interrupt<CR>

if has('nvim')
    tnoremap <Esc> <c-\><c-n>
endif

let mapleader = ','

filetype plugin indent on
let &cpo=s:cpo_save
unlet s:cpo_save
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set fileencodings=utf-8,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8
set modelines=0
set window=0
set number
set hidden
set nowrap
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch
set switchbuf=usetab,newtab
set nojoinspaces
set clipboard=unnamedplus
set cino=:0,=4             " fix indentation for switch statements
"set cursorline
"let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
"set noshowmatch         " Don't match parentheses/brackets
set laststatus=2
set noshowcmd
set noshowmode
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
"set scrolljump=8       " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
autocmd BufWritePre * :%s/\s\+$//e

set guitablabel=%N/\ %t\ %M

" vim: set ft=vim :

" enables to search in all open buffers with :Search <pattern>
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! GrepBuffers (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=0 Cclear call setqflist([]) | cclose

command! -nargs=+ Search call setqflist([]) | call GrepBuffers(<q-args>) | copen

let g:deoplete#enable_at_startup = 1


"let g:chromatica#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"let g:chromatica#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"let g:chromatica#responsive_mode=1
"let g:chromatica#enable_at_startup=1

let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'

"let g:deoplete#sources#clang#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"let g:deoplete#sources#clang#clang_header='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'

let g:python3_host_prog='/usr/bin/python3'

" YCM python autocomplete
let g:ycm_python_binary_path = '/usr/bin/python3'


let g:user_emmet_leader_key=','

set completeopt -=preview

syntax enable

colorscheme sonokai
set background=dark

" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-darktooth

" Highlight matching brace
set visualbell
" Use visual bell (no beeping)

set ruler
" Show row and column ruler information

map <C-e> :w<CR>:!python %<CR>
" seting F9 to save and compile python

set viminfo^=h
" higlight match in search

let mapleader=","
" mapping leader key

" navigate in vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set spell spelllang=pt_br
" spell checking
vnoremap // y/<C-R>"<CR>
" search for visual selected text

set directory^=$HOME/.vim/tmp//
"preventing vim to create .swp files in work directory

" Better display for messages
set cmdheight=2

command! Config execute ":e $MYVIMRC"
command! Reload execute "source init.vim"

if !has('gui_running')
  set t_Co=256
endif


" ALE configuration
let g:ale_fix_on_save =  1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter =  0
let g:ale_lint_on_save =  1
let g:ale_lint_on_filetype_changed =  1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code: %s [%severity%]'
let g:ale_open_list =  0
let g:ale_set_quickfix =  1
let g:ale_set_loclist =  1
let g:ale_set_highlights =  1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'yapf'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\}

" vim-fugitive configuration
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

" vim-gitgutter configuration
let g:gitgutter_map_keys =  0
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▍'
let g:gitgutter_sign_removed_above_and_below = '▍'
let g:gitgutter_sign_modified_removed = '▍'
let g:gitgutter_override_sign_column_highlight =  0
let g:gitgutter_preview_win_floating =  1
let g:gitgutter_realtime =  1
let g:gitgutter_eager =  0

" vim-surround configuration
" Use dot repeat with surround
nmap ds  ds
nmap cs  cs
nmap ys  ys
nmap yS  yS
nmap yss yss
nmap ySs ySs
nmap ySS ySS

" vim-commentary configuration
" Use <Leader>c to comment out a line
nmap <Leader>c gcc
" Use <Leader>C to comment out a block
vmap <Leader>C gc

" vim-airline configuration
let g:airline_theme='dark'
let g:airline_powerline_fonts =  1
let g:airline#extensions#branch#enabled =  1
let g:airline#extensions#hunks#enabled =  1
let g:airline#extensions#tagbar#enabled =  1
let g:airline#extensions#whitespace#enabled =  1
let g:airline#extensions#ycm#enabled =  1

" vim-polyglot configuration
" Disable autoindent feature if it's causing issues
let g:polyglot_disabled = ['autoindent']
" Disable sensible defaults if you prefer your own settings
let g:polyglot_disabled = ['sensible']

" vim-multiple-cursors configuration
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'

" coc.nvim configuration

" Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >=   0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <C-p> to trigger the completion menu.
inoremap <expr> <C-p> coc#refresh()

" Use <C-n> to select the next item in the completion menu.
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-p>"

" Use <C-y> to confirm the completion.
inoremap <expr> <C-y> pumvisible() ? "\<C-y>" : "\<C-p>"

" Use <C-e> to close the completion menu.
inoremap <expr> <C-e> pumvisible() ? "\<C-e>" : "\<C-p>"

" Use <C-l> to trigger the signature help.
inoremap <silent><expr> <C-l> coc#refresh()

" Use <C-f> to format the current buffer.
nmap <silent> <C-f> <Plug>(coc-format)

" Use <C-a> to fix the current line.
nmap <silent> <C-a> <Plug>(coc-codeaction)

" Use <C-d> to show the documentation of the symbol under the cursor.
nmap <silent> <C-d> <Plug>(coc-documentation)

" Use <C-r> to rename the symbol under the cursor.
nmap <silent> <C-r> <Plug>(coc-rename)

" Use <C-t> to open the TypeScript definition in a new tab.
nmap <silent> <C-t> <Plug>(coc-type-definition-tab)

" Use <C-x> to open the TypeScript definition in a split window.
nmap <silent> <C-x> <Plug>(coc-type-definition-split)

" Use <C-v> to open the TypeScript definition in a vertical split window.
nmap <silent> <C-v> <Plug>(coc-type-definition-vertical)

" Use <C-q> to open the TypeScript definition in a preview window.
nmap <silent> <C-q> <Plug>(coc-type-definition-preview)

" Use <C-u> to open the TypeScript definition in a floating window.
nmap <silent> <C-u> <Plug>(coc-type-definition-floating)

" Use <C-z> to open the TypeScript definition in a floating window with a border.
nmap <silent> <C-z> <Plug>(coc-type-definition-floating-border)

" Use <C-p> to open the TypeScript definition in a floating window with a border and a shadow.
nmap <silent> <C-p> <Plug>(coc-type-definition-floating-border-shadow)

" Use <C-m> to open the TypeScript definition in a floating window with a border, a shadow, and a margin.
nmap <silent> <C-m> <Plug>(coc-type-definition-floating-border-shadow-margin)

" Use <C-s> to open the TypeScript definition in a floating window with a border, a shadow, a margin, and a padding.
nmap <silent> <C-s> <Plug>(coc-type-definition-floating-border-shadow-margin-padding)

" Use <C-o> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, and a scrollbar.
nmap <silent> <C-o> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar)

" Use <C-i> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, and a status line.
nmap <silent> <C-i> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline)

" Use <C-y> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, and a title.
nmap <silent> <C-y> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title)

" Use <C-u> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, and a close button.
nmap <silent> <C-u> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton)

" Use <C-i> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, and a minimize button.
nmap <silent> <C-i> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton)

" Use <C-o> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button.
nmap <silent> <C-o> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton)

" Use <C-p> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button.
nmap <silent> <C-p> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreenbutton)

" Use <C-m> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button, and a help button.
nmap <silent> <C-m> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreenbutton-helpbutton)

" Use <C-s> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button, and a help button, and a settings button.
nmap <silent> <C-s> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreenbutton-helpbutton-settingsbutton)

" Use <C-y> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button, and a help button, and a settings button, and a refresh button.
nmap <silent> <C-y> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreen-helpbutton-settingsbutton-refreshbutton)

" Use <C-i> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button, and a help button, and a settings button, and a refresh button, and a save button.
nmap <silent> <C-i> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreen-helpbutton-settingsbutton-refreshbutton-savebutton)

" Use <C-u> to open the TypeScript definition in a floating window with a border, a shadow, a margin, a padding, a scrollbar, a status line, a title, a close button, a minimize button, and a maximize button, and a fullscreen button, and a help button, and a settings button, and```
nmap <silent> <C-u> <Plug>(coc-type-definition-floating-border-shadow-margin-padding-scrollbar-statusline-title-closebutton-minimizebutton-maximizebutton-fullscreen-helpbutton-settingsbutton-refreshbutton-savebutton-cancelbutton)
