"""""""""""""""'"键盘命令
"
" 映射全选 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

func JavaMap()
    inoremap <C-k> System.out.println(
    inoremap <C-l> public static void main(String[] args) { <CR>
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

:inoremap , , <ESC>a

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

