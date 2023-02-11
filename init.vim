let pluggedPath = '~/.config/nvim/plugged'

"plugins
call plug#begin(pluggedPath)

Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'tpope/vim-surround' "surrounding ysiw)

Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

Plug 'ctrlpvim/ctrlp.vim' " file search
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive' " Git commands
Plug 'chrisbra/Colorizer'

Plug 'udalov/kotlin-vim'

Plug 'neoclide/coc.nvim', { 'branch': 'master'} " Auto Completion

Plug 'vim-airline/vim-airline' " advanced status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

call plug#end()

let mapleader = " "

nnoremap Y y$
nnoremap 0 ^

" color for quick-scope
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" color scheme
colorscheme orbital "pablo
let g:AirlineTheme='orbital'

" features
filetype plugin indent on
syntax enable

" tabbing
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" settings
set autoread
set autowrite
set clipboard=unnamedplus
set complete+=kspell " :set spell to activate dictonary spelling
set cursorcolumn
set cursorline
set encoding=utf-8
set history=50
set ignorecase
set incsearch
set mouse=a
set noruler
set noshowmode
set nowrap
set number
set path+=** "search for subfolders with :find
set relativenumber
set scrolloff=2
set showmatch
set smartcase
set undofile
set wildmenu "menu for ^^ && other things

" coc requirements
set cmdheight=2
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
nmap <leader>F gg=G<C-o>
nmap <leader>f :Format<CR>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>l  :<C-u>CocListResume<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

"NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '*'
let g:NERDTreeDirArrowCollapsible = '~'

"Better Whitespace
let g:better_whitespace_ctermcolor='darkblue'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
"close vim if only nerdtree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Ctrlp
nnoremap <leader>p :CtrlP<CR>

"Colorizer
nnoremap <leader><leader>c :ColorToggle<CR>
"Set Spell
nnoremap <leader><leader>s :set spell<CR>
nnoremap <leader><leader>S :set nospell<CR>
"Switch buffer
nnoremap <leader>b :bn<CR>
nnoremap <leader>B :bp<CR>

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
