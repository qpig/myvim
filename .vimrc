set nu!
colorscheme desert
set tabstop=4
set shiftwidth=4
set scrolloff=3
set showcmd
set hlsearch
set incsearch
set noignorecase
set title
set ttyfast
set modeline
set modelines=3
set shortmess=alI
set nostartofline
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030
"" if set this quickfix will can't run
"set errorformat=%*\\d>%f(%l)\ :\ %t%[A-z]%#\ %m 
set nocompatible
filetype on
filetype plugin indent on
syntax enable
syntax on
set cindent
"set autoindent
"set smartindent
"set smarttab
set backspace=eol,start,indent
retab
set bsdir=buffer
set noautochdir "bu自动设置目录为正在编辑的文件所在的目录 
set nobackup
set noswapfile

""ctags
set tags+=$HOME/.vim/tags
"set tags+=/root/.vim/general_include/tags
"set tags+=/root/.vim/stl_src/tags
"set tags+=/root/.vim/gtest-1.6.0/tags
"set tags+=/root/.vim/glibc-2.12.1/tags
"set tags+=/root/.vim/glib-2.0/tags
"set tags+=/usr/include/tags
"set tags+=/root/.vim/cppunit_src/tags

""taglist
let Tlist_Show_One_File = 1      			"只显示当前文件的tag
let Tlist_Use_Right_Window = 1      			"在右侧窗口中显示taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Show_Menu=0
let Tlist_Enable_Fold_Column = 0
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow=1

""cscope
cs reset
"set cscopequickfix=s-,c-,d-,i-,t-,e-
let Cscope_OpenQuickfixWindow = 1
"let cscopecscopetagorder = 1
set csto=1
set cst
set nocsverb
if filereadable("/home/pig/.vim/cscope.out")
	cs add $HOME/.vim/cscope.out
endif
set csverb


""SuperTab
let g:SuperTabCrMapping = 0"可以使用回车选中
let g:SuperTabLongestEnhanced = 1
set completeopt=menuone,menu,longest,preview
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabRetainCompletionType="context"
let g:neocomplcache_auto_completion_start_length=2

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
"上面的映射都是在插入模式下的映射，解释如下：
"- 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"- 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"- 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"- 如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；


"" NERDTree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31

"" std_c语法着色插件配置
let c_syntax_for_h = 1

"" 用空格键来开关折叠
set foldmethod=syntax
""nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

""总是显示状态行
set laststatus=2
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

nnoremap <silent> <F3> :Rgrep<CR>
map <silent> <F4> : A <CR>
nmap <silent> <F5> :cnext<CR>              "跳到下一个编译错误
nmap <silent> <F6> :cp<CR>
""<F7> gdb used
map <silent> <F9> : NERDTreeToggle <CR>
imap <silent> <F9> : NERDTreeToggle <CR>
map <silent> <F10> : TlistToggle<CR>
imap <silent> <F10> : TlistToggle<CR>
map <silent> <F12> :!$HOME/.vim/gen_cscope.sh<CR>

""gdb 调试
let g:vimgdb_debug_file = ""
run macros/gdb_mappings.vim

" man
source $VIMRUNTIME/ftplugin/man.vim
nmap <C-K> :Man 3 <cword><CR>
imap <C-K> <ESC><C-K>

"" doxygen
let g:doxygenToolkit_authorName="xiaoqiang.zhu,564388878@qq.com"
let g:doxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
"let g:DoxygenToolkit_licenseTag="Copyright (C) Ejitec"
let g:doxygen_enhanced_color=1
