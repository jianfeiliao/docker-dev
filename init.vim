" Set up Vundle
call plug#begin('~/.nvim/plugged')

Plug 'gmarik/vundle'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Shougo/vimproc'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'kassio/neoterm'

call plug#end()

" colorscheme vividchalk
set hlsearch        " Highlight search
set incsearch       " Increment search
set autoindent      " Always set autoindenting on
set copyindent      " Copy the previous indentation on autoindenting
set list            " Show all whitespaces
set number          " Always show line numbers
set shiftwidth=4    " Number of spaces to use for autoindenting
set shiftround      " Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch       " Set show matching parenthesis
set ignorecase      " Ignore case when searching
set smartcase       " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " Insert tabs on the start of a line according to shiftwidth, not tabstop
set smartindent     " Use smart indentation
set backspace=2     " More natural backspace
set laststatus=2    " Always show the status line
set hidden          " Hides the buffer instead of closing them
set history=1000    " Remember more commands and search history
set undolevels=1000 " Use many levels of undo
set scrolloff=5     " Keep the cursor to have 5 lines of context

" Allow easy copy/paste for large amounts of text
set pastetoggle=<F3>

" Remember last edit position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable swp file creation
set noswapfile
set nobackup

" Quit NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree
map <F2> :NERDTreeToggle<CR>
" More compatible sidebar
let g:NERDTreeDirArrows=0
" Allow quick linking for the opened file to nerdtree
map <leader>f :NERDTreeFind<cr>

" Disable mouse for NeoVim
set mouse-=a

" Vim-Go stuff
"filetype plugin on
"let g:go_disable_autoinstall = 0
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
nmap <leader>i \| :GoImports<CR>
nmap <c-b> :w<CR> \| :GoBuild<CR>
nmap <c-t> :w<CR> \| :GoTest<CR>
"nmap <c-i> :GoInfo<CR>

" VimShell stuff
"let g:vimshell_prompt = "$> "
"let g:vimshell_popup_height = 50
"map <leader>` :VimShellPop<CR>

" Disable preview window
set completeopt-=preview 

" Neovim Terminal
" tnoremap <Esc> <C-\><C-n>

