execute pathogen#infect()

autocmd FocusLost * :wa

imap jk <Esc>

let mapleader=","       " set leader key to comma
set autoread            " automatically re-read file changed outside of vim
set colorcolumn=80,100  " add column at 80 and 100 characters
set mouse=a             " enable mouse in all modes
set noerrorbells        " don't use any bells for errors
set novisualbell        " don't use any visual flashes for errors
set nowrap              " do not wrap lines
set relativenumber      " show relative line numbers
set ruler               " show line and column number
set shiftwidth=2        " number of spaces for autoindent
set softtabstop=2       " number of spaces for <Tab> in editing
set tabstop=2           " number of spaces for <Tab> in file counts
set expandtab           " for tabs as spaces
set title               " set window title
set encoding=utf-8      " set default encoding to UTF-8
set backspace=indent,eol,start  " backspace through everything in insert mode
set list                " show invisible characters
set scrolloff=10        " keep 10 lines of text above/below the cursor when near the top/bottom of buffer

au BufRead,BufNewFile *.markdown,*.md set filetype=markdown
autocmd FileType gitcommit,markdown setlocal spell
autocmd FileType gitcommit,markdown set complete+=kspell
set spellfile=~/.vim/en.utf-8.add

" hilight the current line in current window; may slow down redrawing for long
" lines or large files
autocmd winenter * setlocal cursorline
autocmd winleave * setlocal nocursorline

" highlight the current column in current window; may slow down redrawing
" for long lines or large files
autocmd winenter * setlocal cursorcolumn
autocmd winleave * setlocal nocursorcolumn

syntax enable
set background=light
colorscheme solarized

match ErrorMsg '\s\+$'  " highlight trailing whitespace as error

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
" set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
" set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...

" Disable arrow keys in command mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._

""
"" Backup and swap files
""

set noswapfile

set backupdir^=~/.vim/_backup//    " where to put backup files.

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
endif

map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Clears cache so newly created files show up during ctrl p
map <C-P> :CtrlPClearAllCaches<CR>:CtrlP<CR>

"" Ack convenience
map <leader>a :Ack!
