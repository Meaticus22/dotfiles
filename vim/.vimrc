"----------------------------------------------------------------
"   		 _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------
"  Version : 9.0
"  License : MIT
"  Author  : Meaticus22
"  URL     : https://github.com/meaticus22/dotfiles
"----------------------------------------------------------------
" =============================================================================
" -----------------------------------------------------------------------------
" heavily inspired by: @factorylabs, @scrooloose, @nvie, @gf3, @bit-theory.
" =============================================================================
" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible        	" Disable vi compatibility

filetype on             	" filetype must be 'on' before setting it 'off'
                        	"   otherwise it exits with a bad status and breaks
                        	"   git commit.
filetype off            	" force reloading *after* pathogen loaded

" set the runtime path to include Vundle and initialize
set rtp+=/opt/homebrew/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'gregsexton/MatchTag'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'frazrepo/vim-rainbow'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'tribela/vim-transparent'
Plugin 'amix/vim-zenroom2'
Plugin 'ap/vim-css-color'
Plugin 'garbas/vim-snipmate'
Plugin 'millermedeiros/vim-statline'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plugin 'lervag/vimtex'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'conornewton/vim-latex-preview'
Plugin 'conornewton/vim-pandoc-markdown-preview'
" Enable mouse use in all modes
set mouse=a

"Vim vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'monochrome'
let g:airline_theme_patch_func = 'AirlineThemePatch'

function AirlineThemePatch(palette)
  let a:palette.normal.airline_c = [ '#292929', '', 235, '']
  let a:palette.insert.airline_c = [ '#292929', '', 235, '']
  let a:palette.visual.airline_c = [ '#292929', '', 235, '']
  let a:palette.replace.airline_c = [ '#292929', '', 235, '']
  let a:palette.inactive.airline_c = [ '#292929', '', 235, '']
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

set nospell
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden              	" can put buffer to the background without writing
                        	"   to disk, will remember history/marks.
set lazyredraw          	" don't update the display while executing macros
set ttyfast             	" Send more characters at a given time.


" --- history / file handling ---
set history=999         	" Increase history (default = 20)
set undolevels=999      	" Moar undo (default=100)
set autoread            	" reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault            	" RegExp global by default
set magic               	" Enable extended regexes.
set hlsearch            	" highlight searches
set incsearch           	" show the `best match so far' astyped
set ignorecase smartcase	" make searches case-insensitive, unless they
                        	"   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set esckeys                 	" Allow cursor keys in insert mode.
set nostartofline           	" Make j/k respect the columns
" set virtualedit=all        	" allow the cursor to go in to 'invalid' places
set timeoutlen=500          	" how long it wait for mapped commands
set ttimeoutlen=100         	" faster timeout for escape key and others


" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set termguicolors          	" 256 colors terminal

colorscheme 256_noir
set background=dark
" Change highlighting of cursor line when entering/leaving Insert Mode
set nocursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

" --- UI settings ---


if has('gui_running')
	set guifont=MelsoLGDZ Nerd\ Font:h16
	set gfn:MelsoLGDZ Nerd\ Font:h16
	set transp=0.0

	" toolbar and scrollbars
	set guioptions-=T   	" remove toolbar
	set guioptions-=h  	" only calculate bottom scroll size of current line
	set shortmess=atI   	" Don't show the intro message at start and
                        	"   truncate msgs (avoid press ENTER msgs).
endif


set laststatus=2        	" Always show status line
set number              	" Enable line numbers.
set numberwidth=5       	" width of numbers line (default on gvim is 4)
set report=0            	" Show all changes.
set showmode            	" Show the current mode.
set showcmd             	" show partial command on last line of screen.
set showmatch           	" show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title               	" Show the filename in the window title bar.

set scrolloff=5         	" Start scrolling n lines before horizontal
                        	"   border of window.
set sidescrolloff=7     	" Start scrolling n chars before end of screen.
set sidescroll=1        	" The minimal number of columns to scroll
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
set wildmenu            	" Hitting TAB in command mode will
set wildchar=<TAB>      	"   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif


" --- diff ---
set diffopt=filler      	" Add vertical spaces to keep right
                        	"   and left aligned.
set diffopt+=iwhite     	" Ignore whitespace changes.


" --- folding---
set foldmethod=manual   	" manual fold
set foldnestmax=3       	" deepest fold is 3 levels
set nofoldenable        	" don't fold by default


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list


" --- remove sounds effects ---
set noerrorbells
set visualbell

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[5 q" "SR = REPLACE mode
let &t_EI.="\e[6 q" "EI = NORMAL mode (ELSE)

"auto reload vimtex pdf
autocmd Filetype tex setl updatetime=1


" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab               	" Expand tabs to spaces
set autoindent smartindent  	" auto/smart indent
set copyindent              	" copy previous indentation on auto indent
set softtabstop=2           	" Tab key results in # spaces
set tabstop=2               	" Tab is # spaces
set shiftwidth=2            	" The # of spaces for indenting.
set smarttab                	" At start of line, <Tab> inserts shift width
                            	"   spaces, <Bs> deletes shift width spaces.

set wrap                    	" wrap lines
set textwidth=80
set formatoptions=qrn1      	" automatic formating.
set formatoptions-=o        	" don't start new lines w/ comment leader on
                            	"   pressing 'o'

set nomodeline              	" don't use modeline (security)

set pastetoggle=<leader>p   	" paste mode: avoid auto indent, treat chars
                            	"   as literal.



" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0     	"show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
"autocmd vimenter * NERDTree
noremap <C-S> :NERDTreeToggle<CR>


" --- NERDCommenter ---

let NERDSpaceDelims=1           	" space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
	\ 'scss': { 'left': '//' }
\ }


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


" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1


" --- vim-signify ---
let g:signify_update_on_focusgained = 1



" --- LustyJuggler ---
let g:LustyJugglerSuppressRubyWarning = 1  " avoid error if running on terminal


" --- statline ---
" errors color
hi User3 guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
let g:statline_mixed_indent_string = '[mix]'

" --- toggle indentation mode ---

function! ToggleExpandTab()
	if &et
    	set noet softtabstop=0
	else
    	execute "set et softtabstop=". &tabstop
	endif
endfunction

noremap <silent> <leader>et :call ToggleExpandTab()<CR>


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


" --- Bracey Settings ---
let g:bracey_auto_start_browser = 1
nnoremap <Leader>b :Bracey<CR>


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
vmap  <expr>  <S-UP> 	DVB_Drag('up')
vmap  <expr>  D    	DVB_Duplicate()


" --- transform lists ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=17m30

nmap <leader>ls :call ListTrans_toggle_format()<CR>
vmap <leader>ls :call ListTrans_toggle_format('visual')<CR>

" --- vim-rainbow ---
let g:rainbow_active = 1

" --- emmet-vim ---
" press crtl+z+, to activate emmet-vim
let g:user_emmet_leader_key=','

" --- coc.nvim ---
let g:coc_config_home = '~/.vim'




" --- goyo vim ---
let g:goyo_height='80%'
let g:goyo_width='80%'
function! s:goyo_enter()
  set linebreak
  set spell spelllang=en_us
endfunction

function! s:goyo_leave()
  set nolinebreak
  set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>g :Goyo<CR>

" Must be global so that it can be read by syntax/startify.vim.
let g:startify_center=80



" Vimtex {{{
" let g:vimtex_view_method = 'general'
" let g:vimtex_view_general_callback = 'TermPDF'
" let g:vimtex_view_automatic = 0

" Key Bindings
" nnoremap <Leader>e :VimtexCompile<CR>

"PDF Live Viewer (https://github.com/conornewton/vim-latex-preview)
let g:latex_pdf_viewer="$HOME/.config/termpdf.py/termpdf.py"
let g:latex_preview_clean = 1

nnoremap <Leader>w :StartLatexPreview<CR>


"Vim Pandoc Markdown Preview(https://github.com/conornewton/vim-pandoc-markdown-preview)
let g:md_pdf_viewer="$HOME/.config/termpdf.py/termpdf.py"
let g:md_args = "--template eisvogel --listings"

nnoremap <Leader>p :StartMDPreview<CR>


" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" mapleader set at the top of the file to avoid conflicts


" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" faster commands
" nnoremap <space> :

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

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


" add spaces inside current parenthesis
map <leader>( vi(xi  P
