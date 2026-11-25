" >> My .vimrc <<

" ===============================================================================================================
" 0- Sistema:
" ===============================================================================================================

set clipboard=unnamedplus 
set mouse=a
set number
set relativenumber 
set showcmd 
set showtabline=2
set autoread 
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set laststatus=2
set noshowmode

autocmd FocusGained,BufEnter * checktime

" ===============================================================================================================
" 1- Mapeamento:
" ===============================================================================================================

let mapleader = ";"

" Navegação de abas
nnoremap <C-Up> :tabnew<CR> 
nnoremap <C-Down> :tabclose<CR> 
nnoremap <C-Right> :tabnext<CR> 
nnoremap <C-Left> :tabprevious<CR> 

" Gerenciamento de arquivos
nnoremap <C-f> :e<space> 
nnoremap <C-n><C-f> :tabnew<space> 

set timeout
set timeoutlen=5000
set ttimeoutlen=50

" ===============================================================================================================
" 2- Code:
" ===============================================================================================================

set tabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent 
set smartindent
set ignorecase 
set smartcase

syntax on 
set t_Co=256

" ================================================================================================================
" 3- Plugins:
" ================================================================================================================ 

filetype plugin indent on

" NERDTree
nnoremap <C-]> :NERDTreeToggle<CR>

nnoremap <C-M-Left> <C-w>h
inoremap <C-M-Left> <C-o><C-w>h
vnoremap <C-M-Left> <C-c><C-w>h

nnoremap <C-M-Right> <C-w>l
inoremap <C-M-Right> <C-o><C-w>l
vnoremap <C-M-Right> <C-c><C-w>l

" CtrlP
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard --exclude="*.swp" --exclude="*.zip"'],
  \ },
  \ 'fallback': 'find %s -type f -not -path "*/.*" -not -name "*.swp" -not -name "*.zip"'
\ }
let g:ctrlp_show_hidden = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Coc.nvim
set statusline^=%{coc#status()}

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Atalhos e navegação do Coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>x <Plug>(coc-rename)

let g:coc_user_config = {'suggest.autoTrigger': 'none'}

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Nul>   coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Vim-Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1

" Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_position = 'bottomright'
let g:floaterm_width = 0.50
let g:floaterm_height = 0.80

" ================================================================================================================
" 4- Rice:
" ===============================================================================================================

colorscheme elflord 
