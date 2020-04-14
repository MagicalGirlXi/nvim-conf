" Key Bind Cheat Sheet
" The <leader> is <space>
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Basic Keybindings
" <<<<<<<<<<Normal Mode>>>>>>>>>>
" j : move down
" k : move up
" h : move left
" l : move right
" u : undo
" C-r : redo
" yy : copy current line
" dd : cut current line
" p : paste
" <<<<<<<<<<Insert Mode>>>>>>>>>>
"
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Plugin nerdcommenter
" https://github.com/preservim/nerdcommenter
" <leader> + cn : Comment out the current line or text
" <leader> + cc : Comment selected in Visual mode
" <leader> + cu : Uncomment the line
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Plugin coc.nvim
" https://github.com/neoclide/coc.nvim
" <up> <down> <left> <right> : switch the pointer in the suggestions
" <enter> : choose the selected suggestions
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Plugin vim-easy-align
" ga + character : align by the character
"
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Plugin vim-terminal-help
" <leader>/ : toggle the terminal under the window
"
"
"
"
"



" Some basic settings
let &t_ut=''
set number
augroup relative_numbser
	autocmd!
	autocmd InsertEnter * :set relativenumber
	autocmd InsertLeave * :set norelativenumber
augroup END
set mouse=a
set cursorline
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set viewoptions=cursor,folds,slash,unix
set wrap
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set showmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set updatetime=1000
set completeopt=menu,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set virtualedit=block

" Let the TAB change to space in different filetype
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif


" Keybindings
" Set <LEADER> as <SPACE>
let mapleader=" "

" Edit and load the vimrc
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>src :source ~/.config/nvim/init.vim<CR>
" Search
noremap <LEADER><CR> :nohlsearch<CR>
" Press <shift> and move can be faster
noremap <silent> K 5e
noremap <silent> J 5j
noremap <silent> H 5h
noremap <silent> L 5l

noremap <C-Y> 5<C-y>
noremap <C-E> 5<C-e>

" Pane management
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>


" Resize pane with Ctrl + arrow keys
noremap <C-up> :res -3<CR>
noremap <C-down> :res +3<CR>
noremap <C-left> :vertical resize-3<CR>
noremap <C-right> :vertical resize+3<CR>


" Tab management
" Create a new tab with tu
noremap tc :tabe<CR>
" Move around tabs with tn and ti
noremap tl :-tabnext<CR>
noremap th :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tml :-tabmove<CR>
noremap tmh :+tabmove<CR>


" Begin Plugin Managment By vim-plug
call plug#begin('~/.vim/bundle')

" Theme Plugins
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
" Other Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'tmux-plugins/vim-tmux'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line<Paste>
Plug 'skywind3000/vim-terminal-help'

" Dependence

call plug#end()
" End Plugins

" Begin coc.nvim setting
let g:coc_global_extensions = ['coc-html', 'coc-json', 'coc-css', 'coc-gitignore', 'coc-vimlsp', 'coc-git', 'coc-explorer', 'coc-cmake', 'coc-clangd']
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" End coc.nvim setting


" Start vim-easy-align

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" End vim-easy-align




" Begin vim-terminal-help
 
let g:terminal_key="<leader>/"

" End vim-terminal-help


" Begin terminal configuration
tnoremap <C-n> <C-\><C-N>
let g:neoterm_autoscroll = 1
" End terminal configuration


" Begin file explorer configuration

" End file explorer configuration




" Begin Theme configuration
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
hi NonText ctermfg=gray guifg=grey10
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
colorscheme onedark
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
" End Theme configuration























