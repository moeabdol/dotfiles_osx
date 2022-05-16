" protect against programs overwriting my .vimrc
if &compatible
  set nocompatible
endif

call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree' , { 'on':  'NERDTreeToggle' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
call plug#end()

syntax on
filetype on
filetype plugin indent on

" force true color when using regular vim inside tmux as the colorscheme
" can appear to be grayscale with 'termguicolors' option enabled.
if (has("termguicolors"))
	let &t_8f ="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b ="\<Esc>[48;2;%lu;%lu;%lum"
	set t_Co=256
	set termguicolors
endif

" colorscheme
let g:tokyonight_style='night'
let g:tokyonight_enable_italic=1
colorscheme tokyonight
set background=dark

" set sane defaults
set encoding=utf8
set fileencoding=utf8
set showcmd
set noshowmode
set showmatch
set number
set autoindent
set copyindent
set nowrap
set breakindent
set showbreak=↳
set laststatus=2
set nohidden
set ignorecase
set smartcase
set infercase
set textwidth=80
set ruler
set winwidth=80
set colorcolumn=+1
set mouse=a
set list
set listchars=tab:\·\ ,nbsp:␣
set listchars+=trail:·
set listchars+=extends:▶
set listchars+=precedes:◀
set listchars+=eol:↲
set fillchars+=vert:│
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set nocursorcolumn
set splitright
set splitbelow
set timeout
set timeoutlen=1000
set shortmess+=c
set belloff+=ctrlg
set autoread
set paste

" case insensitive search
set ignorecase
set smartcase
set infercase

" auto-completion
set completeopt+=popup
set completeopt+=menuone,longest,noselect

" fuzzy find
set path+=**

" commandline tab completion
set wildmenu
set wildmode=list,full
set wildoptions=pum
set wildignorecase

" ignore files
set wildignore=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg

" search highlight
set hlsearch
set incsearch

" language-specific
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType help wincmd L

" center navigation
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" resize windows
nnoremap <silent> <C-w>j :resize -3<CR>
nnoremap <silent> <C-w>k :resize +3<CR>
nnoremap <silent> <C-w>h :vertical resize -3<CR>
nnoremap <silent> <C-w>l :vertical resize +3<CR>

" remove trailing whitespaces
" function! TrimSpaces()
	" %s/\s*$//
	" ''
" endfunction
" autocmd FileWritePre   * call TrimSpaces()
" autocmd FileAppendPre  * call TrimSpaces()
" autocmd FilterWritePre * call TrimSpaces()
" autocmd BufWritePre    * call TrimSpaces()

" leaderkey
let mapleader      =','
let maplocalleader =','

" add lines above/below
nnoremap <leader>o o<esc>k$
nnoremap <leader>O O<esc>j$

" remove search highlighting when done
noremap <CR> :nohlsearch<CR>

" visual indentation
noremap < <gv
vnoremap > >gv

" terminal mappings
set termwinsize=""
autocmd TerminalOpen * setlocal nonumber norelativenumber nocursorline
nnoremap <C-W>t :term ++shell ++rows=10<CR>
tnoremap <C-h> <C-W>h
tnoremap <C-j> <C-W>j
tnoremap <C-k> <C-W>k
tnoremap <C-l> <C-W>l
tnoremap <silent> <C-w>j :resize -3<CR>
tnoremap <silent> <C-w>k :resize +3<CR>
tnoremap <silent> <C-w>h :vertical resize -3<CR>
tnoremap <silent> <C-w>l :vertical resize +3<CR>

" comments
augroup CommentLikeABoss
	autocmd!
	autocmd FileType c,cpp,go                    let b:comment_leader = '// '
	autocmd FileType ruby,python                 let b:comment_leader = '# '
	autocmd FileType cfg,conf,fstab,sh,bash,tmux let b:comment_leader = '# '
	autocmd FileType tex                         let b:comment_leader = '% '
	autocmd FileType mail                        let b:comment_leader = '> '
	autocmd FileType vim                         let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-b>silent <C-e>norm ^i<C-r>=b:comment_leader<CR><CR>
noremap <silent> ,uc :<C-b>silent <C-e>norm ^xx<CR>

" quickfix
nnoremap <leader>co :botright cwindow<CR>
nnoremap <leader>cl :ccl<CR>

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" nerdtree
nnoremap <F1> :NERDTreeToggle<CR>
	let g:NERDTreeMapOpenSplit='<C-s>'
	let g:NERDTreeMapOpenVSplit='<C-v>'
	let NERDTreeMapActivateNode='<space>'
	let NERDTreeIgnore = ['.pyc$[[file]]', '.swp$[[file]]', '.git$[[dir]]', '.sass-cache$[[dir]]', 'map$[[file]]']
	let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" ale
let g:ale_completion_enabled=1
let g:ale_set_quickfix=1
let g:ale_open_list=1
let g:alet_sign_error=''
let g:alet_sign_warning=''
let g:alet_sign_info=''
" nmap <silent> <leader>k <Plug>(ale_previous)
" nmap <silent> <leader>j <Plug>(ale_next)

" fzf
let g:fzf_layout = { 'down': '30%' }

nnoremap <silent> <C-p>         :Files<CR>
nnoremap <silent> <C-x><C-p>       :Rg<CR>
nnoremap <silent> <Leader>g    :GFiles<CR>
nnoremap <silent> <Leader>s  :GFiles!?<CR>
nnoremap <silent> <Leader>ls  :Buffers<CR>

function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --hidden --color=always --smart-case %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	let options = fzf#vim#with_preview(options, 'right:50%', 'ctrl-/')
	call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" hexkinase
autocmd VimEnter,BufEnter * HexokinaseTurnOff
let g:Hexokinase_highlighters = ['sign_column']
nnoremap ,hx :HexokinaseToggle<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ ['mode'],
	  \				[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" autoreload changes
autocmd FocusLost,WinLeave * :silent! noautocmd w

" reload .vimrc
autocmd! BufWritePost ~/.vimrc source %
