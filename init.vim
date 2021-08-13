let mapleader=" "
noremap ; :
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
map Q :x<CR>
map R :source ~/.config/nvim/init.vim<CR>
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
noremap <LEADER>wl <C-w>v <C-w>l
noremap <LEADER>wh <C-w>v <C-w>h
noremap <LEADER>wk <C-w>s <C-w>k
noremap <LEADER>wj <C-w>s <C-w>j
noremap <leader>tn :tabnew<CR>
"FZ

call plug#begin('~/.vim/plugged')

"color theme
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'

Plug 'airblade/vim-rooter'

Plug 'kevinhwang91/rnvimr'

"language about
""lisp
Plug 'kovisoft/slimv', {'for': ['lisp', 'lsp']}
"""Plug 'kovisoft/paredit'
"another language
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"html
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript', 'css']}
"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown', 'vim-plug']}
""generate table
Plug 'dhruvasagar/vim-table-mode'
"cmake
Plug 'vhdirk/vim-cmake', {'for': ['cmake']}
"c++
Plug 'bfrg/vim-cpp-modern', {'for': ['cpp', 'c']}
"kotlin
Plug 'udalov/kotlin-vim', {'for': ['kotlin']}
"glsl
Plug 'tikhomirov/vim-glsl', {'for': ['glsl']}
"clojure
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
"dart
Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
"Prolg
Plug 'soli/prolog-vim', {'for': 'prolog'}

"nerd
Plug 'preservim/nerdcommenter'

"language spector
"Plug 'cpiger/NeoDebug'

"search
Plug 'junegunn/fzf.vim'

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"input
Plug 'yuweijun/vim-im'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi'

Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-xtabline'
Plug 'liuchengxu/vista.vim'
Plug 'lambdalisue/suda.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'


Plug 'wakatime/vim-wakatime'

Plug 'sbdchd/neoformat'

Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'

Plug 'liuchengxu/vim-which-key'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"defx
nmap <silent>tt :Defx -columns=icons:indent:filename:type<CR>

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

"asynctasks
let g:asyncrun_open = 6

"which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=300

"cmake
function CMakeccls() abort
    let rootDir = FindRootDirectory()
    execute "!~/.config/nvim/scripts/cclsCmake.sh " . rootDir
endfunction

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"rnimr
nnoremap <silent> <leader>f :RnvimrToggle<CR>
let g:rnvimr_hide_gitignore = 1

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
"color gruvbox
colorscheme deus
"autocmd vimenter * colorscheme gruvbox
"set termguicolors
"set background=dark
"highlight Normal guibg=NONE ctermbg=None
"let g:SnazzyTransparent = 1

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

"coc
set updatetime=100
set shortmess+=c
set signcolumn=yes

"Coc extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tasks',
  \ 'coc-word',
  \ 'coc-lists',
  \ 'coc-vimlsp',
  \ 'coc-translator',
  \ 'coc-snippets',
  \ 'coc-cmake',
  \ 'coc-markdownlint',
  \ 'coc-highlight',
  \ 'coc-xml',
  \ 'coc-perl',
  \ 'coc-html',
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
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <c-o> coc#refresh()
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
endfunction
nnoremap <silent> <LEADER>K :call <SID>show_documentation()<CR>

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rt <Plug>(coc-refactor)

nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search buffer
nnoremap <silent><nowait> <space>b :<C-u>CocList buffers<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ss  :<C-u>CocList -I symbols<cr>
" Search words
nnoremap <space>sw :CocSearch 
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap ts <Plug>(coc-translator-p)

nnoremap <leader>ts :CocList tasks<CR>

xmap <leader>a <Plug>(coc-format-selected)
nmap <leader>aw <Plug>(coc-format-selected)w

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


" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.

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

"Neoformat
nnoremap <leader>rf :Neoformat! c++ astyle<CR>

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

"airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

"startify
let g:webdevicons_enable_startify = 1
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 FlyDog'), "\n"))


"doxygen
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="lizqwer scott"
let g:DoxygenToolkit_licenseTag="GPL"

" vim-cpp-modern
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

"suda
let g:suda_smart_edit = 1

"vista
noremap <leader>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:scrollstatus_size = 15

"xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap <leader>xs :XTabMode<CR>

