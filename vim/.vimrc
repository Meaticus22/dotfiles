"----------------------------------------------------------------
"        	_
" 	_   __(_)___ ___  __________
"	| | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------
"  Version : 9.0
"  License : MIT
"  Author  : Meaticus22
"  URL 	: https://github.com/meaticus22/dotfiles
"----------------------------------------------------------------
" =============================================================================
" -----------------------------------------------------------------------------
" heavily inspired by: @factorylabs, @scrooloose, @nvie, @gf3, @bit-theory.
" =============================================================================
" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible            " Disable vi compatibility

filetype on                 " filetype must be 'on' before setting it 'off'
                            "   otherwise it exits with a bad status and breaks
                            "   git commit.
filetype off                " force reloading *after* pathogen loaded

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/Command-T'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/LustyJuggler'
Plugin 'gregsexton/MatchTag'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/clam.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'junkblocker/patchreview-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mhinz/vim-signify'
Plugin 'int3/vim-extradite'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'maxboisvert/vim-simple-complete'
Plugin 'spolu/dwm.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'tribela/vim-transparent'
Plugin 'sheerun/vim-polyglot'
Plugin 'amix/vim-zenroom2'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" css
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" js
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'millermedeiros/vim-esformatter'
" Bundle 'marijnh/tern_for_vim'
" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


Plugin 'millermedeiros/vim-statline'
" Plugin 'bling/vim-airline'

" colorschemes
Plugin 'tomasr/molokai'
Plugin 'sainnhe/sonokai'

" Enable mouse use in all modes
set mouse=a

"Vim vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='raven'
let g:airline_theme_patch_func = 'AirlineThemePatch'

function! AirlineThemePatch(palette)
 let a:palette.normal.airline_c = [ '#424242', '', 235, '']
 let a:palette.insert.airline_c = [ '#424242', '', 235, '']
 let a:palette.visual.airline_c = [ '#424242', '', 235, '']
 let a:palette.replace.airline_c = [ '#424242', '', 235, '']
 let a:palette.inactive.airline_c = [ '#424242', '', 235, '']
endfunction


" required for vundle
call vundle#end()

syntax on
filetype plugin indent on   " enable detection, plugins and indent


" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps


" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
                            "   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.


" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
                            "   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set esckeys                     " Allow cursor keys in insert mode.
set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others


" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif




" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

" --- kitty color issues ---
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''



set termguicolors              " 256 colors terminal

let g:molokai_original=0
colorscheme molokai
" make 'var' keyword easier to spot
hi link javascriptType Keyword
" default ColorColumn is too distractive
 hi clear ColorColumn
 hi link ColorColumn FoldColumn
"  defaul line number is too distractive
 hi clear LineNr
 hi link LineNr Comment
 hi link OverLength Error

" --- UI settings ---


if has('gui_running')
    set guifont=MelsoLGDZ Nerd\ Font:h16
    set gfn:MelsoLGDZ Nerd\ Font:h16
    set transp=0.5

    " toolbar and scrollbars
    set guioptions-=T       " remove toolbar
    set guioptions-=L       " left scroll bar
    set guioptions-=r       " right scroll bar
    set guioptions-=b       " bottom scroll bar
    set guioptions-=h      " only calculate bottom scroll size of current line
    set shortmess=atI       " Don't show the intro message at start and
                            "   truncate msgs (avoid press ENTER msgs).
endif


set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
                            "   horizontally.

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" use relative line number by default
if exists('+relativenumber')
  set relativenumber
endif

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif


" --- diff ---
set diffopt=filler          " Add vertical spaces to keep right
                            "   and left aligned.
set diffopt+=iwhite         " Ignore whitespace changes.


" --- folding---
set foldmethod=manual       " manual fold
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list


" --- remove sounds effects ---
set noerrorbells
set visualbell




" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=80
"set colorcolumn=+1              " Show large lines
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.



" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
"autocmd vimenter * NERDTree
noremap <C-S> :NERDTreeToggle<CR>


" --- NERDCommenter ---

let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
\ }


" --- Syntastic : Linting / Error check ---
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
" close/open location list (errors)
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :Errors<CR> :lw<CR>
noremap <silent><leader>ln :lnext<CR>
noremap <silent><leader>lp :lprev<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" more config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '𝐗'

" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" see [autocommands] at the end for more autocomplete settings

" nodejs-complete / jscomplete
let g:node_usejscomplete = 1
let g:jscomplete_use = ['dom', 'moz']

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-Space>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabDefaultCompletionType = "<c-p>"


" --- snipmate ---
let g:snips_author = 'Meaticus22'


" --- EasyMotion ---
let g:EasyMotion_leader_key = '<Leader>m'
" lets make <leader>F and <leader>f use easymotion by default
let g:EasyMotion_mapping_f = '<leader>f'
let g:EasyMotion_mapping_F = '<leader>F'



" --- Strip trailing whitespace ---
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Trailing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>


" --- matchit ---
runtime macros/matchit.vim          " enable matchit (better '%' key mapping)


" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1


" --- vim-signify ---
let g:signify_update_on_focusgained = 1


" --- Command-T ---
let g:CommandTPreferredImplementation='ruby'
let g:CommandTMaxFiles=2000
let g:CommandTMaxHeight=12
noremap <silent> <leader>tt :CommandT<CR>
noremap <silent> <leader>bt :CommandTBuffer<CR>
noremap <silent> <leader>tf :CommandTFlush<CR>



" --- LustyJuggler ---
let g:LustyJugglerSuppressRubyWarning = 1  " avoid error if running on terminal


" --- statline ---
" errors color
hi User3 guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
let g:statline_mixed_indent_string = '[mix]'


" --- gundo ---
nnoremap <leader>gu :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1


" --- toggle indentation mode ---

function! ToggleExpandTab()
    if &et
        set noet softtabstop=0
    else
        execute "set et softtabstop=". &tabstop
    endif
endfunction

noremap <silent> <leader>et :call ToggleExpandTab()<CR>


" --- Show syntax highlighting groups for word under cursor ---
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
nnoremap <leader>sh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" faster wehn opening files with large lines
set synmaxcol=300


" --- Highlight word under cursor ---
" hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
" nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr>


" --- Tabular.vim ---
noremap <silent> <leader>t: :Tabularize /:<CR>
noremap <silent> <leader>t= :Tabularize /=<CR>
noremap <silent> <leader>t, :Tabularize /,<CR>
noremap <silent> <leader>t{ :Tabularize /{<CR>
noremap <silent> <leader>t" :Tabularize /"<CR>
noremap <silent> <leader>t' :Tabularize /'<CR>
noremap <silent> <leader>t[ :Tabularize /[<CR>
noremap <silent> <leader>t/ :Tabularize ///<CR>
noremap <silent> <leader>t\| :Tabularize /\|<CR>


" --- include content of static files ---
" borrowed from: http://vim.1045645.n5.nabble.com/vim-counterpart-for-persistent-includes-td4276915.html

function! IncludeStatic()
 :g/<!-- #include "[^"]*" -->\_.\{-}<!-- end include -->/let fname = matchstr(getline('.'),'<!-- #include "\zs[^"]*\ze" -->')|exec '+,/<!-- end include -->/-!cat '.fnameescape(fname)
endfunction

noremap <silent> <leader>ic :call IncludeStatic()<CR>



" --- convert selected text from markdown to HTML ---
vnoremap <silent> <leader>md :! mdown<CR>

function! SanitizeMdown()
    %s/<\/\?p>//
    %s/<br \?\/\?>/ /
    %s/<pre><code>/<pre class="brush:js">\r/
    %s/<\/code><\/pre>/<\/pre>/
endfunc
noremap <silent> <leader>mds :call SanitizeMdown()<CR>



" --- format JavaScript source code using esformatter --

nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>



" --- toggle autocomplete behavior and word delimiters ---

function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc


" --- visual block move ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=35m10

let g:DVB_TrimWS = 1
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()


" --- transform lists ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=17m30

nmap <leader>ls :call ListTrans_toggle_format()<CR>
vmap <leader>ls :call ListTrans_toggle_format('visual')<CR>

" --- vim-rainbow ---
let g:rainbow_active = 1

" --- emmet-vim ---
" press crtl+z+, to activate emmet-vim
let g:user_emmet_leader_key=','

" --- semantic_highlight ---
let g:semantic_highlight_javascript = 1
let g:semantic_highlight_python = 1
let g:semantic_highlight_ruby = 1
let g:semantic_highlight_php = 1
let g:semantic_highlight_java = 1
let g:semantic_highlight_c = 1
let g:semantic_highlight_cpp = 1
let g:semantic_highlight_objc = 1
let g:semantic_highlight_objcpp = 1
let g:semantic_highlight_html = 1
let g:semantic_highlight_css = 1
let g:semantic_highlight_xml = 1
let g:semantic_highlight_json = 1
let g:semantic_highlight_yaml = 1
let g:semantic_highlight_perl = 1
let g:semantic_highlight_shell = 1
let g:semantic_highlight_lua = 1
let g:semantic_highlight_sql = 1
let g:semantic_highlight_vim = 1
let g:semantic_highlight_markdown = 1
let g:semantic_highlight_go = 1
let g:semantic_highlight_rust = 1
let g:semantic_highlight_swift = 1
let g:semantic_highlight_typescript = 1
noremap <C-J> :SemanticHighlightToggle<CR>


" --- coc.nvim ---
let g:coc_config_home = '~/.vim'

" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" mapleader set at the top of the file to avoid conflicts


" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" faster commands
" nnoremap <space> :

" sudo write
" command! W w !sudo tee % > /dev/null

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
" nnoremap    v   <C-V>
" nnoremap <C-V>     v
" vnoremap    v   <C-V>
" vnoremap <C-V>     v

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" next tab
nnoremap <C-Tab> :tabn<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Bubble single lines, similar to Eclipse (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Duplicate lines, similar to Eclipse
noremap <C-S-Up> YP
noremap <C-S-Down> YP

" 'fix' search regexp to be compatible with Perl format
" nmap / /\v
" vmap / /\v

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll()<CR> *
nnoremap # :silent call KeywordsAll()<CR> #


" --- COMMON STUFF / HELPERS ---

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" Open file (useful for HTML)
noremap <silent> <leader>o :!open %<CR>

" Reformat code
nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Pull word under cursor into LHS of a substitute (find and replace)
nnoremap <leader>rr :silent call KeywordsAll()<CR> :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Insert/append a single character
" noremap ,, i_<esc>r
" noremap ;; a_<esc>r

" Visually select the text that was last edited/pasted
nnoremap <leader>v `[v`]

" fast Ack
nnoremap <leader>a :tab split<CR>:Ack<Space>
nnoremap <leader>aw :silent call KeywordsAll()<CR> :tab split<CR>:Ack<cword><CR> :silent call KeywordsBasic()<CR>

" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>


" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Move windows around (only works on same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
map <leader>bp :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" add spaces inside current parenthesis
map <leader>( vi(xi  P



" -----------------------------------------------------------------------------
" FILE HANDLING
" -----------------------------------------------------------------------------

" [autocommands] borrowed from @bit-theory vimfiles and edited
augroup mm_buf_cmds
    " clear commands before resetting
    autocmd!

    " when vimrc is edited, reload it
    autocmd bufwritepost .gvimrc source %
    autocmd bufwritepost .vimrc source %

    " Only show cursorline in the current window and in normal mode
    " au WinLeave,InsertEnter * set nocul
    " au WinEnter,InsertLeave * set cul

    " filetype
    autocmd BufNewFile,BufRead *.json setf json
    autocmd BufNewFile,BufRead *.hx setf haxe

    autocmd FileType mustache runtime! ftplugin/html/sparkup.vim

    " Enable omnicomplete for supported filetypes
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " jscomplete is a separate plugin
    autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " make `gf` search for .js files
    autocmd FileType javascript setlocal suffixesadd=.js
    autocmd FileType javascript setlocal path+=js,scripts


    " make sure `complete` works as expected for CSS class names without
    " messing with motions (eg. '.foo-bar__baz') and we make sure all
    " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
    autocmd InsertEnter,BufLeave * :silent call KeywordsAll()
    autocmd InsertLeave,BufEnter * :silent call KeywordsBasic()

    " yes, we need to duplicate it on VimEnter for some weird reason
    autocmd VimEnter * nnoremap * :silent call KeywordsAll()<CR> *
    autocmd VimEnter * nnoremap # :silent call KeywordsAll()<CR> #


    " Toggle relative/absolute line numbers during edit
    " if exists('+relativenumber')
        autocmd InsertEnter * setl nu
        autocmd InsertLeave,BufEnter * setl rnu
    " endif

    " highlight char at column 81 (textwidth + 1)
    autocmd BufEnter * match OverLength /\%81v/

    " Color Column (only on insert)
    if exists("&colorcolumn")
        autocmd InsertEnter * set colorcolumn=80
        autocmd InsertLeave * set colorcolumn=""
    endif
augroup END
