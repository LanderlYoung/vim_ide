"""""""""""""""""""""""""""""新文件标题""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.js,*.go,*.py,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh' || &filetype == 'python'
		if &filetype == 'python'
            call setline(1, "\#!/usr/bin/python")
		else
            call setline(1, "\#!/bin/bash")
		endif
		call append(line("."), "\#########################################################################")
		call append(line(".")+1, "\# File Name:\t\t".expand("%"))
		call append(line(".")+2, "\# Author:\t\t\tLanderl Young")
		call append(line(".")+3, "\# e-Mail:\t\t\tLanderlYoung@gmail.com")
		call append(line(".")+4, "\# Created Time:\t\t".strftime("%c"))
		call append(line(".")+5, "\#########################################################################")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "  > File Name:     ".expand("%"))
		call append(line(".")+1, "  > Author:        Landerl Young")
		call append(line(".")+2, "  > Mail:          LanderlYoung@gmail.com")
		call append(line(".")+3, "  > Created Time:  ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif

	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%<").expand(" {"))
		"call append(line(".")+7,"")
	endif

	if &filetype == 'c'
		call append(line(".")+6,"#include <stdio.h>")
		"call append(line(".")+7,"")
	endif

	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "")
		call append(line(".")+8, "using namespace std;")
		"call append(line(".")+9, "")
	endif
	"新建文件后，自动定位到文件末尾
	"autocmd BufNewFile * normal G
    normal Go
endfunc
