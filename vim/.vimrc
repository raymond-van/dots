" Set line numbers
set number        " Show line numbers
set relativenumber " Show relative line numbers

" Enable syntax highlighting
syntax enable

" Set the default tab behavior
set expandtab      " Use spaces instead of tabs
set tabstop=4      " Set the number of spaces per tab
set shiftwidth=4   " Set the number of spaces for auto-indent
set softtabstop=4  " Set the number of spaces a tab character represents

" Enable line wrapping
set wrap           " Wrap text at the edge of the window
set linebreak      " Break lines at word boundaries

" Show matching parentheses and brackets
set showmatch      " Show matching parentheses, brackets, etc.

" Enable clipboard support (if Vim is compiled with +clipboard)
set clipboard=unnamedplus  " Use system clipboard for copy/paste

" Enable search highlighting and case-insensitive search
set incsearch      " Highlight matches while typing
set ignorecase     " Ignore case when searching
set smartcase      " Use case-sensitive search if search contains uppercase

" Enable auto-indentation
filetype plugin indent on  " Automatically detect and set indentation rules for file types
set smartindent    " Automatically indent lines based on context
set autoindent     " Auto-indent new lines

" Set default search options
set hlsearch       " Highlight search results
set wildmenu       " Show autocomplete for commands and file names

" Set a default font and line height for better readability (useful for GVim or GUI Vim)
set guifont=Monospace:h12

" Enable undo history
set undofile       " Enable persistent undo
set undodir=~/.vim/undo  " Set directory for undo files
if !isdirectory(expand('~/.vim/undo'))
  silent! mkdir ~/.vim/undo
endif

" Enable auto-completion for text (useful for code and writing)
set completeopt=menuone,noinsert,noselect  " Better completion options
set shortmess+=c   " Avoid completion message when no matches

" Set colorscheme and enable 256-color support
set t_Co=256       " Enable 256 colors
" colorscheme desert " Set the colorscheme (choose another if preferred)

" Enable mouse support
set mouse=a        " Enable mouse support in all modes

" Show command in the status line
set cmdheight=2    " Set command line height (more space for messages)

" Enable line numbers in split windows
set numberwidth=4  " Space reserved for line numbers

" Enable smart home and end keys behavior
set smarttab       " Enable smart tab behavior
set backspace=indent,eol,start  " Make backspace delete over everything

" Map some useful keybindings
nnoremap <C-s> :w<CR>   " Save file with Ctrl+S
nnoremap <C-q> :q<CR>   " Quit with Ctrl+Q
nnoremap <C-x> :wq<CR>  " Save and quit with Ctrl+X

" Show line and column number in the status line
set statusline=%F\ %l/%L\ %c

" Enable searching for words under the cursor
nnoremap * *<CR>       " Search for the word under the cursor
nnoremap # #<CR>       " Search for the previous occurrence of the word under the cursor

" Enable folding (useful for code)
set foldmethod=syntax " Use syntax-based folding
set foldlevel=99      " Open all folds by default

" Highlight the current line
set cursorline        " Highlight the line where the cursor is

" Set up undo/redo mapping
nnoremap <C-z> u      " Undo with Ctrl+Z
nnoremap <C-r> Ctrl+r " Redo with Ctrl+R

" Auto reload files if changed outside of Vim
set autoread         " Automatically reload files when they change outside of Vim

" Disable swap file creation (optional)
set noswapfile       " Disable swap file creation (be careful with this)

" Enable better syntax highlighting for programming languages
filetype plugin indent on

" Automatically remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Customize the color of the current line highlight
highlight CursorLine ctermbg=000 guibg=#2e2e2e

