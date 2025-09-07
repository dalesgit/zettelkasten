set nocompatible   " Don't try to be vi compatible
filetype off   " Helps force plugins to load correctly when it is turned back on below
syntax on    " Turn on syntax highlighting
filetype plugin indent on   " For plugins to load correctly
" TODO: Pick a leader key
" let mapleader = ","
"
set modelines=0     " Security
" set number    " Show line numbers
set nonumber    " Hide line numbers
set ruler  " Show file stats
set visualbell   " Blink cursor on error instead of beeping (grr)
set encoding=utf-8  " Encoding
" set wrap  " Whitespace
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set linebreak " Wraps text at the end of a word. ...
set nolist " You must turn off list which displays whitespace characters as text.
set linebreak
set nolist
set spell
set scrolloff=3   " Cursor motion
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim
" Move up/down editor lines
nnoremap j gj
nnoremap k gk
set hidden   " Allow hidden buffers
set ttyfast   " Rendering
set laststatus=2   " Status bar
set showmode   " Last line
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
" gq{motion} (:help gq) Formats the lines covered by {motion}.
" A motion can generally be any command that would move the cursor, 
" in which case it covers everything between the initial and final cursor 
" positions, or a "text object".
"
map <leader>q gqip


set listchars=tab:▸\ ,eol:¬   " Visualize tabs and newlines

" set list " To enable by default  " Uncomment this to enable by default:
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
"colorscheme default
colorscheme delek
"
" shortcut to Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-r> :Ranger<CR>

" for how to open markdown links
" https://stackoverflow.com/questions/64837484/follow-local-file-link-in-vim-with-markdown-syntax
" let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_edit_url_in = 'vsplit'
"let g:vim_markdown_edit_url_in = 'hsplit'
"
" ---------------------------- 
" Plugin section
" ----------------------------
" cf. https://github.com/junegunn/vim-plug
call plug#begin()
"
" to add wiki highlighting?
Plug 'lervag/wiki-ft.vim'
"
" Plug 'bpstahlman/txtfmt'
Plug 'tpope/vim-surround'
"
" footnotes in markdown
"
" vim-plug
Plug 'vim-pandoc/vim-markdownfootnotes'
"
" for aligning tables
" [Align GitHub-Flavored Markdown Tables in Vim](https://thoughtbot.com/blog/align-github-flavored-markdown-tables-in-vim "Align GitHub-Flavored Markdown Tables in Vim")
" see leader bslash setup below
" Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
"
Plug 'francoiscabrol/ranger.vim'   " ranger integration
"
Plug 'lervag/wiki.vim'
"
" cf. https://github.com/dyng/ctrlsf.vim
" for directions on how to run ctrlsf
" to get this working I install ack, silversearcher-ag, and ripgrep
" concise directions at https://github.com/dyng/ctrlsf.vim/blob/master/doc/ctrlsf.txt
Plug 'dyng/ctrlsf.vim'
Plug 'itchyny/calendar.vim'
"
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'shime/vim-livedown'
" ----------
" https://github.com/preservim/vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'" Make sure you use single quotes
"Plug 'jalvesaq/zotcite'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
"
call plug#end()
"
" -------
" easy align
" Align GitHub-flavored Markdown tables
" au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
" below is for ease of use https://github.com/dhruvasagar/vim-table-mode
"
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" -----
"
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" for cut paste? this doesn't seem to work
vnoremap <C-c> "+y
vnoremap <C-v> "+p
"
" -------------------------
"
" lervag/wiki.vim section
let g:wiki_root = '~/storage/shared/Download/wiki-vim'
  augroup init_calendar
    autocmd!
    autocmd FileType calendar
          \ nnoremap <silent><buffer> <cr>
          \ :<c-u>call wiki#journal#open()<cr>
  augroup END
"
" ------------------------------------
function! CustomUserFunc(ctx, text) abort
    return a:ctx.name . ': ' . substitute(a:text, 'An old', 'A new', '')
endfunction
"
    function! TemplateFallback(context)
      call append(0, '---' )
      call append(1, 'title: ' . a:context.name )
      call append(2, 'date: ' . a:context.date )
      call append(3, 'tags: ' )
      call append(4, '---' )
      call append(5, '# ' . a:context.name )
    endfunction
"
    let g:wiki_templates = [
          \ { 'match_re': 'index',
          \   'source_filename': '~/storage/downloads/wiki-vim/templates/template.md'},
          \ { 'match_re': 'blog',
          \   'source_filename': '~/storage/downloads/wiki-vim/templates/blogtemplate.md'},
          \ { 'match_re': '2024',
          \   'source_filename': '~/storage/downloads/wiki-vim/templates/journaltemplate.md'},
          \ { 'match_func': {x -> v:true},
          \   'source_func': function('TemplateFallback')},
          \]


" nnoremap q :qall!<cr>
"
" ------------------------
" normal mapping for Markdown preview
" https://github.com/iamcco/markdown-preview.nvim
" normal/insert
"<Plug>MarkdownPreview
"<Plug>MarkdownPreviewStop
"gg<Plug>MarkdownPreviewToggle

" example
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

    let g:wiki_mappings_local = {
          \ '<plug>(wiki-pages)' : '<C-g>',
          \ 'x_<plug>(wiki-pages)' : '<C-g>',
          \ '<plug>(wiki-journal-prev)' : '<C-h>',
          \ '<plug>(wiki-journal-next)' : '<C-j>',
          \}
"
" for Ctrlsf
" or 'cwd' (current working directory) or 'project'
map <C-M-f> :CtrlSF
let g:ctrlsf_default_root = '~/storage/downloads'
let g:ctrlsf_default_view_mode = 'compact'
    let g:ctrlsf_backend = 'rg'
"
" as suggested in the repository
" for info re. mapping https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
nmap     <C-S>f <Plug>CtrlSFPrompt
vmap     <C-S>f <Plug>CtrlSFVwordPath
vmap     <C-S>F <Plug>CtrlSFVwordExec
nmap     <C-S>n <Plug>CtrlSFCwordPath
nmap     <C-S>p <Plug>CtrlSFPwordPath
nnoremap <C-S>o :CtrlSFOpen<CR>
nnoremap <C-S>t :CtrlSFToggle<CR>
inoremap <C-S>t <Esc>:CtrlSFToggle<CR>
"
nmap gm :LivedownToggle<CR>
"---
" insert date/time
map <leader>D :put =strftime('# %a %Y-%m-%d %H:%M:%S%z')<CR>
set foldlevelstart=99
"
" set wiki.vim link types
"
" let g:wiki_link_creation = {
"          \ 'md': {
"          \   'link_type': 'wiki',
"          \   'url_extension': '.md',
"          \ },
"          \}
" per https://github.com/lervag/wiki-ft.vim/blob/master/doc/wiki-ft.txt
"let g:wiki_loaded = 0
"
"redirect escape key
inoremap kj <esc>
