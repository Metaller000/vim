"   >> VIM <<

"let &path.=","         " переменная path, которая содержит список папок для поиска файлов по названию, разделенный запятыми.
set t_Co=256            " включает поддержку цветов
set exrc                " она говорит vim'у искать дополнительный .vimrc в текущей рабочей директории.
set secure              " в основном, она запрещает внешним .vimrc писать что-то в файлы, 
                        " выполнять комманды шелла и отображает маппинги, которые создаются.
set tabstop=4           " количество пробелов, которыми символ табуляции отображается в тексте.
"set softtabstop=4      " количество пробелов, которыми символ табуляции отображается при добавлении.
set shiftwidth=4        " по умолчанию используется для регулирование ширины отступов в пробелах добавляемых командами >> и <<.
set smartindent         " включаем ‘умную’ автоматическую расстановку отступов.
set expandtab           " позволяет при нажатии на клавишу TAB вставлять в текст пробелы.
set colorcolumn=130     " подсветка предела строки.
highlight ColorColumn ctermbg=red		
                        " цвет предела строки.
set number              " номерация строк.
set background=dark     " включает отображение номеров строк
""""""""""""""""""""""" " функция F5 для компиляции и вывода ошибок и F9 для компиляции и запуска
function! BindF5_C()    
    if filereadable("Makefile")
        set makeprg=make
        map <f5>      :w<cr>:make<cr>:cw<cr>
        imap <f5> <esc>:w<cr>:make<cr>:cw<cr>
    else
        map <f5>      :w<cr>:make %:r<cr>:cw<cr>
        imap <f5> <esc>:w<cr>:make %:r<cr>:cw<cr>
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF5_C()
function! BindF9_C()
    if filereadable("Makefile")
        set makeprg=make
        map <f9>      :w<cr>:make<cr>:cw<cr>:!./%<<cr>
        imap <f9> <esc>:w<cr>:make<cr>:cw<cr>:!./%<<cr>
    else
        map <f9>      :w<cr>:make %:r<cr>:cw<cr>:!./%<<cr>
        imap <f9> <esc>:w<cr>:make %:r<cr>:cw<cr>:!./%<<cr>
    endif
endfunction
au FileType c,cc,cpp,h,hpp,s call BindF9_C()
""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   >> Vundle <<

set nocompatible        " be iMproved, required
filetype off            " required

set rtp+=~/.vim/bundle/Vundle.vim               " назначает путь к файловому манагеру Вандал
call vundle#begin()
                                                " как альтернатива, для установки плагинов можно заначить путь вод-так
                                                " call vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'                      " разрешаем Вандалу обновлять самого себя
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:bling/vim-airline.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'

" Plugin ''                                     " по анологии выше вставляем ssh плагинов выше

call vundle#end()            " required
filetype plugin indent on    " required

" памятка
" :PluginList       - лист установленных плагинов
" :PluginInstall    - установка указаных выше плагинов; добавляем `!` для апдейта плагинов или пишем :PluginUpdate
" :PluginSearch foo - для поиска метапеременной; 
" :PluginClean      - отчищаем список неиспользуеммых плагинов; добавляем `!` для автоматической отчистки
" :h vundle для деталей или wiki для FAQ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	>> NERDtree <<

" автозапуск плагина
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	>> Airline <<

" позволяет использовать свои символы для плагина
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" включить/выключить интеграцию со сторонними плагинами
let g:airline_enable_branch = 1
let g:airline_enable_fugitive = 1
let g:airline_enable_syntastic = 1
let g:airline_enable_bufferline = 1

" симбволы юникода
let g:airline_theme='badwolf'
let g:airline_left_sep = '▙'
let g:airline_right_sep = '▟'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" отображение открыnых буферов
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▙'
let g:airline#extensions#tabline#buffer_idx_mode = 1

" показывать буффер строку только при двух открытых
"let g:airline#extensions#tabline#buffer_min_count = 2
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#show_close_button = 0

" быстрые клавишы переключения между открытыми буферами
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap #1 :bp<cr>				" следующий буфер
  nmap #2 :bn<cr>				" предидущий буфер
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   >> YCM <<


