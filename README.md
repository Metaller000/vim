# vim

###### "YouCompleteMe" далее "YCM".
###### 1. Для удобства работы с vim скопируйте ".vim/" и ".vimrc" в "home/user/" или другую директорию,
######    из-под которой бeдете работать с vim.
###### 2. .vim/bundle/ используеться для плагинов.
###### 3. .vimrc текстовый фаил, хранит в себе настройки для vim'а и плагинов.
###### 4. На данный момент стоят следующие плагины:
######    Vundle.vim   - менеджер плагинов.
######    nerdtree     - навигация по директориям.
######    vim-airline  - красивая подсветка буферов и изменений.
######    YCM          - автодополнение для языков семейства C.
###### 5. После копирования в нужную директорию, запустите vim (из-под неё), 
######    обновите и докачайте плагины при помощи команды ":VundleUpdate".
######    После апдейта получите предупреждение от Vundle по поводу YCM, 
######    данный плагин нужно собирать под вашей системой, для этого закройте vim (":qa", если произведены изменения ":qa!"),
######    зайдите в директорию с YCM (пример кода: "cd ~/.vim/bundle/YouCompleteMe"), затем запустите install.sh (./install.sh).
######   Для коректной компиляции необходимо обновить или установить python-dev библиотеки (sudo apt-get install python-dev).
###### 6. Запускаем vim проверяем работоспособность.
