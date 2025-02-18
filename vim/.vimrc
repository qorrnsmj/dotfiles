" Jetpack setting ---------------------------------------------------
packadd vim-jetpack
call jetpack#begin()

" Plugins
Jetpack 'tani/vim-jetpack', { 'opt': 1 } "bootstrap
Jetpack 'https://github.com/dense-analysis/ale' "Code analysis engine
Jetpack 'junegunn/fzf.vim' "Fuzzy finder
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'neoclide/coc.nvim', { 'branch': 'release' } "Conquer of completion
Jetpack 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Jetpack 'itchyny/lightline.vim' "Enhanced status line
Jetpack 'bronson/vim-trailing-whitespace' "Highlight trailing space
Jetpack 'Yggdroot/indentLine' "Display indent line
Jetpack 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
Jetpack 'tpope/vim-surround' "Easily delete, change and add such surroundings in pairs

" Themes
Jetpack 'devsjc/vim-jb', { 'as': 'jb' }
Jetpack 'Luxed/ayu-vim', { 'as': 'ayu' }

call jetpack#end()

" My setting --------------------------------------------------------

" General
set cursorline
set laststatus=2
set number
set showmatch
set virtualedit=onemore
set visualbell
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
nnoremap <S-Tab> 4h4x
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Indent
set smartindent
"let g:indentLine_char = '▏'
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Theme
set termguicolors
syntax enable

let g:jb_style='dark' "jb {dark, light, mid}
let g:ayucolor='mirage' "ayu {dark, light, mirage}
let g:ayu_italic_comment=1
let g:ayu_sign_contrast=1
let g:ayu_extended_palette=1

set background=dark
colorscheme jb

" Paste from Clipboard
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
