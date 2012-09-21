"定义一个tab等同于多少个空格
set tabstop=4 

"按下tab键，插入的是空格和tab制表符的混合，具体如何混合取决于tabstop的设置，若tabstop=4，则逢4空格进一个tab。例如 softtabstop=5，则按一个tab会插入一个tab加一个空格
set softtabstop=4

"把tab换成空格
set expandtab

"程序中自动缩进的长度
set shiftwidth=4

" 在行和段开始处使用制表符 
set smarttab

set smartindent

"高亮
set hls

"不兼容vi
set nocompatible

"搜索时忽略大小写
set ignorecase 

"在状态行上显示光标所在位置的行号和列号 
set ruler 

set nu

"set cindent

set nobackup

"colorscheme slate 

set showmatch


"根据文件类型自动加载相应的插件
filetype plugin on  

"不兼容vi
set nocompatible               

"设置python文件的补全为pysmell
autocmd FileType python set omnifunc=pysmell#Complete
