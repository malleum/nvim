" Plug "coc path
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'

"plugins
call plug#begin('~\AppData\Local\nvim\plugged')

	Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
	Plug 'tpope/vim-surround' "surrounding ysw)
	Plug 'tpope/vim-commentary' " For Commenting gcc & gc
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	Plug 'ntpeters/vim-better-whitespace'
	Plug 'tpope/vim-fugitive' " Git commands
	Plug 'ctrlpvim/ctrlp.vim' " file search

	Plug 'neoclide/coc.nvim', { 'branch': 'master'} " Auto Completion

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'preservim/nerdtree' |
			\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

call plug#end()

let mapleader = ","

nnoremap Y y$
nnoremap <leader>w <C-w><C-w>

" color scheme
colorscheme orbital "pablo
let g:AirlineTheme='orbital'

" features
filetype plugin indent on
syntax enable

" tabbing
set autoindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" settings
set number
set relativenumber
set nowrap
set autoread
set autowrite
set clipboard=unnamedplus
set cursorcolumn
set cursorline
set encoding=utf-8
set history=50
set ignorecase
set incsearch
set mouse=a
set noruler
set showmode
set path+=** "search for subfolders with :find
set wildmenu "menu for ^^ && other things
set complete+=kspell " :set spell to activate dictonary spelling
set showmatch
set smartcase
set scrolloff=2
set undofile

" coc requirements
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c

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
nmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>f ggVG<Plug>(coc-format-selected)<C-o>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"Vim Commenting to ^/
"normal mode
nmap <silent><nowait> <C-_> gcc
"visual mode
vmap <silent><nowait> <C-_> gc

"NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
"Tab
nnoremap <C-i> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '*'
let g:NERDTreeDirArrowCollapsible = '~'

"Better Whitespace
let g:better_whitespace_ctermcolor='darkblue'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"Ctrlp
nnoremap <leader>p :CtrlP<CR>
