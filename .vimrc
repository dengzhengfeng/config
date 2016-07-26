" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme="papercolor"
let g:airline_powerline_fonts = 1
"显示颜色
set t_Co=256
"开启tabline
let g:airline#extensions#tabline#enabled = 1

Plugin 'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
set laststatus=2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

Bundle 'scrooloose/nerdtree'
"符号自动补全
Bundle 'Raimondi/delimitMate'
" for python docstring
"au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0
Bundle 'Valloric/YouCompleteMe'
" https://github.com/Valloric/YouCompleteMe

" Bundle 'altercation/vim-colors-solarized'
" syntax enable
" set background=dark
" colorscheme solarized

" 调整粘贴时的文本缩进
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
set nu

"替换Tab 如果需要输入Tab ctr+v+i
set ts=2 sts=2 sw=2 expandtab
set list
set listchars=tab:▸\ ,trail:¬

"设置不弹出提示
set completeopt-=preview

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
noremap <C-l><C-l> <Esc>$a
inoremap <C-l><C-l> <Esc>$a
noremap <C-h><C-h> <Esc>^i
inoremap <C-h><C-h> <Esc>^i
noremap <C-f> gg=G
"解决backspace键无法删除
set backspace=indent,eol,start
