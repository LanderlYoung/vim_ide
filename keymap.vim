"""""""""""""""'"键盘命令
"
" 映射全选 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

func JavaMap()
    inoremap \prt System.out.println
    inoremap \main public static void main(String[] args) 
endfunc
autocmd FileType java exec ":call JavaMap()"

func IndentAll()
    let lineNum = line(".")
    let col = col(".")
    norm gg=G
    exec 'silent norm! ' . lineNum . 'G' . col .'|'
    unlet lineNum
    unlet col
endfunc
map <C-F12>  :call IndentAll() <CR>


"C，C++,Java 按Ctrl-F5编译运行
map <C-F5> :call CompileRun()<CR>
"
"C,C++,Java 按Ctrl-F4编译
"map <C-F4> :call Compile()<CR>
"
"C,C++,java的调试
"map <C-F7> :call Rungdb()<CR>
"
"map <C-F6> :call Run()<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!make %< && ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'bat'
        exec "! %"
    elseif &filetype == 'sh'
        exec "! ./%"
    endif
endfunc

func! Compile()
    exec "w"
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!make %<"
    elseif &filetype == 'java' 
        exec "!javac %" 
    elseif &filetype == 'bat'
        exec "! %"
    endif
endfunc

func! Run()
    exec "w"
    if &filetype == 'c' || &filetype == 'cpp'
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!java %<"
    elseif &filetype == 'bat'
        exec ":!%"
    endif
endfunc

func! Rungdb()
    exec "w"
    if &filetype == 'c' || &filetype == 'c++'
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
    elseif &filetype == 'java'
        exec "!jdb  %<"
    endif
endfunc

:inoremap , , 

"""for ctags"""
"set tags+="D:\Program Files\Vim\vimfiles\vim_ide\tags"

func! Gentag()
    exec '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'
endfunc
command! -nargs=0 Gentag call Gentag()
"""

"""for cscope"""
set cscopequickfix=s-,c-,d-,i-,t-,e-
"cs add "D:\Program Files\Vim\vimfiles\vim_ide\cscope.out" "D:\Program Files\clang\3.2_64bit\include"
"
func! Genscope()
    exec '!cscope -Rbq '
endfunc
command! -nargs=0 Genscope call Genscope()
"""

inoremap \fn <C-R>=expand("%:t:r")<CR>
inoremap \fe <C-R>=expand("%:t")<CR>
