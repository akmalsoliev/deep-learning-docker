" Plugins will be downloaded under the specified directory.
call plug#begin()

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim'
Plug 'airblade/vim-gitgutter'
" Might utilize vimspector in future, however, at current moment do not have
" time to learn it
" Plug 'puremourning/vimspector'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree Settings
map <silent> <F1> :NERDTreeToggle<CR>

" coc settings
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Minor settings
set number 
set encoding=UTF-8
syntax enable
set autoindent expandtab tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set mouse=a
nnoremap <F10> :w<CR>:! python %<CR>
