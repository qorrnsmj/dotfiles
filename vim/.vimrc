" Jetpack setting ---------------------------------------------------
packadd vim-jetpack
call jetpack#begin()

Jetpack 'tani/vim-jetpack', { 'opt': 1 } "bootstrap
Jetpack 'dense-analysis/ale' "Code analysis engine
Jetpack 'junegunn/fzf.vim' "Fuzzy finder
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
"Jetpack 'neoclide/coc.nvim', { 'branch': 'release' } "Conquer of completion
"Jetpack 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
"Jetpack 'itchyny/lightline.vim' "Enhanced status line
Jetpack 'bronson/vim-trailing-whitespace' "Highlight trailing space
Jetpack 'Yggdroot/indentLine' "Display indent line
"Jetpack 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
"Jetpack 'tpope/vim-surround' "Easily delete, change and add such surroundings in pairs

call jetpack#end()

" My setting --------------------------------------------------------

" General
set nocursorline
set laststatus=0
set number
set relativenumber
set showmatch
set virtualedit=onemore
set visualbell
set wildmode=list:longest
highlight LineNr ctermfg=DarkGray

" Keybinds
nnoremap j gj
nnoremap k gk
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
nnoremap <S-Tab> 4h4x
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Indent
syntax enable
set smartindent
"let g:indentLine_char = '|'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Plugin settings
let g:ale_linters = { 'asm': [] }
set conceallevel=0
