let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch	
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"Lisp
autocmd FileType lisp setlocal tabstop=2
autocmd FileType lisp setlocal shiftwidth=2
autocmd FileType lisp setlocal softtabstop=2
"dart
autocmd FileType dart setlocal tabstop=2
autocmd FileType dart setlocal shiftwidth=2
autocmd FileType dart setlocal softtabstop=2
set list
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set fdm=indent

noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

nnoremap Y y$
vnoremap Y "+y

inoremap <C-l> <Esc>

nmap <C-s> :w<CR>
"nnoremap S :w<CR>
map Q :wq<CR>
map R :source ~/.config/nvim/init.vim<CR>
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>nl <C-w>v <C-w>l
map <LEADER>nk <C-w>s <C-w>k
"FZ

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'

Plug 'kovisoft/slimv', {'for': ['lisp', 'lsp']}
"""Plug 'kovisoft/paredit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'yuweijun/vim-im'
"Plug 'vim-scripts/VimIM'

Plug 'wakatime/vim-wakatime'

Plug 'sbdchd/neoformat'

Plug 'vhdirk/vim-cmake'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'mhinz/vim-signify'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'udalov/kotlin-vim'

Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-fireplace', {'for': 'clojure'}

Plug 'tikhomirov/vim-glsl'

Plug 'dart-lang/dart-vim-plugin'
call plug#end()

set tags=./.tags;,.tags

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"NERDTREE
map tt :NERDTreeToggle<CR>

"Lisp
let g:slimv_swank_cmd = '! st ccl -l ~/.vim/plugged/slimv/slime/start-swank.lisp &'
"paredit
"let g:paredit_mode=0
"let g:paredit_electric_return=0
let g:lisp_rainbow=1

"VimIM
"let g:Vimim_punctuation = 3
"let g:Vimim_cloud='baidu'
"imap <C-Space> <C-_>
"nmap <C-Space> <C-_>

"FZF
noremap <C-f> :FZF<CR>

" TextEdit might fail if hidden is not set.
set hidden

"color dracula
"color snazzy
color gruvbox
"autocmd vimenter * colorscheme gruvbox
"set termguicolors
"set background=dark
"highlight Normal guibg=NONE ctermbg=None
"let g:SnazzyTransparent = 1

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
set updatetime=100
set shortmess+=c

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

"Coc extensions
let g:coc_global_extensions = [
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-spell-checker',
  \ 'coc-vimlsp',
  \ 'coc-translator',
  \ 'coc-snippets',
  \ 'coc-cmake',
  \ 'coc-highlight',
  \ 'coc-xml',
  \ 'coc-perl',
  \ 'coc-html',
  \ 'coc-python',
  \ 'coc-java',
  \ 'coc-pyright',
  \ 'coc-rls',
  \ 'coc-flutter-tools',
  \ 'coc-tsserver']

set termguicolors
autocmd CursorHold * silent call CocActionAsync('highlight')
"Use tab to complete
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]	=~ '\s'
endfunction

"Space place use enter complete
inoremap <silent><expr> <c-o> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <LEADER>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl
    " formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <leader>t :CocCommand translator.popup<CR>
nnoremap <leader>te :CocCommand translator.replace<CR>

"coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"doxygen
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="lizqwer scott"
let g:DoxygenToolkit_licenseTag="GPL"

"gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"vim-cpp-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

