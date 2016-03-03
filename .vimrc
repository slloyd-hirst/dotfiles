call pathogen#infect()
syntax on
filetype plugin indent on
set hlsearch              "Highlight searches
set incsearch             "Incremental search
set ls=2                  "Always show status line in all windows
set autoindent            "Auto indent on new line
set expandtab             "tabs to spaces
set tabstop=2             "Tabs are 2 spaces in width
set shiftwidth=2          "Autodindent to 2 spaces width
set scrolloff=10          "Start scrolling when 10 lines close to the bottom
set ruler                 "Shows current file position
set statusline=%<%f\ %h%m%y%r%=%-14.(%l,%c%V%)\ %P
""set cursorline            "Highlight current row
set novisualbell          "Don't shake the screen
set number                "show line numbers
set title                 "Change title of window based on file
set ttyfast               "Smoother display for fast terminals
set hidden                "Don't close buffers when changing files
set wildchar=<Tab>        "Tab expands wildcards
set fileencoding=utf8     "Unicode man
set encoding=utf-8
set nocompatible          "Get all of vim's awesomeness
set backspace=indent,eol,start "Allow backspacing over tabs end of lines and start of insert
set wildmode=longest,list "Better tab completion of filenames (like bash)
set wildmenu              "as above
set mouse=a
"Allows use of %/ for current directory
cmap %/ %:p:h/

"http://vim.wikia.com/wiki/VimTip906
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set t_Co=256
colorscheme vividchalk
set background=dark       "Tell vim I'm using a dark background
""let moria_style='white'
""let moria_monochrome=1
""colo moria

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
hi IndentGuidesEven ctermbg=234
hi IndentGuidesOdd ctermbg=NONE
let g:ragtag_global_maps = 1

hi CursorLine cterm=none ctermbg=235

"Custom filetypes
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead *.ui set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby
"Tabs and traling space highlighting and sorting out - :retab sorts out tabs
set list listchars=tab:»·,trail:·

" Launch NerdTree
""autocmd VimEnter * NERDTree

" Remove whitespace on save.
autocmd vimenter * ToggleStripWhitespaceOnSave

let mapleader = ","
map <leader>, :CtrlP<CR>
nmap <leader>pry :call InsertDebugger()<CR>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*/tmp/*

set backupdir=/tmp
set directory=/tmp

function! InsertDebugger()
  if(&filetype == 'ruby')
    :normal orequire 'pry'; binding.pry
  else
    :normal odebugger
  endif
   :normal ==
endfunction
