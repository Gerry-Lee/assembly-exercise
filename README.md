# 汇编基础习题集  

> 此仓库中代码为我学习汇编过程中解决过的习题，如果你有其它相关练习打算分享，欢迎提 PR 补充。 **你可以将你的解法分享到此仓库中，如果你有此意愿，请 fork 后在 `code` 目录下新建一个以你名称命名的文件夹，将你的解法放置在该文件夹下，将你的名字添加到此 `README` 末尾的参与者列表，并提交 PR**。如果需要许可声明，请在你的目录下自行添加。

## 题目来源
* 1 ~ 40 题：北京邮电大学，计算机学院，《微机原理与接口技术》课程习题（此部分习题的使用已告知相关课程老师）
* 41 ~ 74 题：选自[中山市飞蛾软件工作室](http://www.feiesoft.com/asm/)，此部分习题的实现可参考以下资料：
 * [中断列表](http://www.feiesoft.com/asm/appendix3.html)
 * [DOS和BIOS的宏定义](http://www.feiesoft.com/asm/appendix4.html)
 * [键盘按键各种编码对照表](http://www.feiesoft.com/asm/appendix5.html)

## 环境配置
* Windows 7 及以上版本：建议使用 `DOSBOX`，当前最新版本 `0.74`。需下载 `masm.exe`，`link.exe`，`debug.exe`。也可以选择 `emu8086`，但该软件使用的汇编语言标准与 MASM 有差异。`DOSBOX` 及配套的工具可以从[此处](http://7xktmz.com1.z0.glb.clouddn.com/dosbox-masm.rar)下载。安装 `DOSBOX` 后运行安装目录下的 `DOSBox 0.74 Options.bat`，在打开的 `dosbox-0.74.conf` 文件最后加上以下两句。其中 `path_to_your_tool` 需替换为你的 `masm.exe`等工具所在的目录。要运行代码，请将代码复制到 `path_to_your_tool` 目录下，之后启动 `DOSBOX`，在 `DOSBOX` 环境下编译、调试。
```
MOUNT C path_to_your_tool
set PATH=$PATH$;path_to_your_tool
```

* Linux/Mac：请访问 `DOSBOX` 官网的 [Download](http://www.dosbox.com/download.php?main=1) 界面，寻找自己系统对应的版本安装。
* 编译、链接，以 `test.asm` 为例。
```
masm test.asm
link test.obj
```

## 习题

**建议：在解决问题本身的前提下，应尽量使程序有更好的容错性，能够尽可能处理非常规输入等可能引发异常的情况；应尽量使程序更好地面向用户，优化交互界面。**

* 1、在 `ARRAY` 数组中依次存储了七个字数据，紧接着是名为 `ZERO` 的字单元，表示如下：  
(1) 如果 BX 包含数组 `ARRAY` 的初始地址，请编写指令将数据 0 传送给 `ZERO` 单元。  
(2) 如果 BX 包含数据 0 在数组中的位移量，请编写指令将数据 0 传送给 `ZERO` 单元。  
```asm
ARRAY	DW  23, 36, 2, 100, 32000, 54, 0
ZERO	DW  ?
```

* 2、请设置一个数据段 `DATASG`，其中定义以下字符变量或数据变量。  
(1) `FLD1B` 为字符串变量：`personal computer`;  
(2) `FLD2B` 为十进制数字节变量：`32`;  
(3) `FLD3B` 为十六进制数字节变量：`20`;  
(4) `FLD4B` 为二进制数字节变量：`01011001`;  
(5) `FLD5B` 为数字的ASCII字符字节变量：`32654`;  
(6) `FLD6B` 为10个零的字节变量;  
(7) `FLD7B` 为零件名(ASCII码)及其数量(十进制数)的表格:  
    `PART1  20`  
    `PART2  50`  
    `PART3  14`  
(8) `FLD1W` 为十六进制数字变量：`FFF0`;  
(9) `FLD2W` 为二进制数的字变量：`01011001`;  
(10) `FLD3W` 为 (7) 零件表的地址变量；  
(11) `FLD4W` 为包括5个十进制数的字变量：`5, 6, 7, 8, 9`;  
(12) `FLD5W` 为5个零的字变量;  
(13) `FLD6W` 为本段中字数据变量和字节数据变量之间的地址差。  

* 3、假设程序中的数据定义如下：  
    `PARTNO	DW		?`    
    `PNAME	DB		16 DUP (?)`  
    `COUNT	DD		?`    
    `PLENTH	EQU	$-PARTNO`  
请问 `PLENTH` 的值为多少？它表示什么意义？

* 4、有符号定义语句如下，问 L 的值是多少？
```asm
BUFF	DB   1, 2, 3, ‘123’
EBUFF	DB   0
L		EQU  EBUFF - BUFF
```

* 5、假设程序中的数据定义如下：  
(1) 用一条 `MOV` 指令将 `LNAME` 的偏移地址放入 AX 。  
(2) 用一条指令将 `CODE_LIST` 的头两个字节的内容放入 SI 。  
(3) 用一条伪操作使 `CODE_LENGTH` 的值等于 `CODE_LIST` 域的实际长度。  
```asm
LNAME		DB  30 DUP (?)
ADDRESS	DB  30 DUP (?)
CITY			DB  15 DUP (?)
CODE_LIST	DB  1, 7, 8, 3, 2
```

* 6、试写出一个完整的数据段 `DATA_SEG` ，它把整数 5 赋予一个字节，并把整数 -1，0，2，5 和 4 放在 10 字数组 `DATA_LIST` 的头 5 个单元中。然后，写出完整的代码段，其功能为：  
把 `DATA_LIST` 中头5个数中的最大值和最小值分别存入 `MAX` 和 `MIN` 单元中。

* 7、按下面的要求写出程序的框架  
(1) 数据段的位置从 `0E000H` 开始，数据段中定义一个 100 字节的数组，其类型属性既是字又是字节;  
(2) 堆栈段从小段开始，段组名为 `STACK` ;  
(3) 代码段中指定段寄存器，指定主程序从 `1000H` 开始，给有关段寄存器赋值;  
(4) 程序结束。  

* 8、写一个完整的程序放在代码段 `C_SEG` 中，要求把数据段 `D_SEG` 中的 `AUGEND` 和附加段`E_SEG` 中的 `ADDEND` 相加，并把结果存放在 `D_SEG` 段中的 `SUM` 中。其中 `AUGEND` 、 `ADDEND` 和 `SUM` 均为双精度数，`AUGEND` 赋值为 99251 ，`ADDEND` 赋值为 -15962。  

* 9、试编写一个汇编语言程序，要求对键盘输入的小写字母用大写字母显示出来。

* 10、编写程序，从键盘接收一个小写字母，然后找出它的前导字符和后续字符，再按顺序显示这三个字符。  

* 11、将 AX 寄存器中的 16 位数分成 4 组，每组 4 位，然后把这四组数分别放在 AL、 BL、 CL和 DL 中。

* 12、试编写一程序，要求比较两个字符串 `STRING1` 和 `STRING2` 所含字符是否完全相同，若相同则显示 `MATCH`，若不相同则显示 `NO MATCH`。

* 13、试编写一程序，要求能从键盘接收一个个位数 N ，然后响铃 N 次(响铃的 ASCII 码为 `07H` )。  

* 14、编写程序，将一个包含有 20 个数据的数组 M 分成两个数组：正数数组 P 和负数数组 N ，并分别把这两个数组中数据的个数显示出来。  

* 15、试编写一个汇编语言程序，求出首地址为 `DATA` 的 `100D` 字数组中的最小偶数，并把它存放在 AX 中。  

* 16、把 AX 中存放的 16 位二进制数 K 看作是 8 个二进制的 “四分之一字节”。试编写程序，数一下值为 3 (即 11B)的四分之一字节数，并将该数(即 11B 的个数)在终端上显示出来。  

* 17、试编写一个汇编语言程序，要求从键盘接收一个四位的 16 进制数，并在终端上显示与它等值的二进制数。

* 18、设有一段英文，其字符变量名为 `ENG` ，并以 `$` 字符结束。试编写一程序，查对单词 `SUN` 在该文中的出现次数，并以格式 `SUN：xxxx` 显示出次数。

* 19、从键盘输入一系列以 `$` 为结束符的字符串，然后对其中的非数字字符计数，并显示出计数结果。

* 20、有一个首地址为 `MEM` 的 100D 字数组，试编制程序删除数组中所有为 0 的项，并将后续项向前压缩，最后将数组的剩余部分补上 0 。

* 21、在 `STRING` 到 `STRING+99` 单元中存放着一个字符串，试编制一个程序测试该字符串中是否存在数字，如有则把 CL 的第 5 位置 1 ，否则将该位置0。

* 22、在首地址为 `TABLE` 的数组中按递增次序存放着 100H 个 16 位补码数，试编写一个程序把出现次数最多的数及其出现次数分别存放于 AX 和 CX 中。

* 23、数据段中已定义了一个有 n 个字数据的数组 M ，试编写一程序求出 M 中绝对值最大的数，把它放在数据段的 `M+2n` 单元中，并将该数的偏移地址存放在 `M+2(n+1)` 单元中。

* 24、在首地址为 `DATA` 的字数组中存放着 100H 个 16 位补码数，试编写一个程序求出它们的平均值放在 AX 寄存器中；并求出数组中有多少个数小于此平均值，将结果放在 BX 寄存器中。

* 25、试编制一个程序把 AX 中的 16 进制数转换为 ASCII 码，并将对应的 ASCII 码依次存放到 `MEM` 数组中的四个字节中。例如，当 `(AX)=2A49H` 时，程序执行完后， `MEM` 中的4个字节内容为`39H`，`34H`，`41H`，`32H`。

* 26、把 0~100D 之间的 30 个数存入以 `GRADE` 为首地址的 30 字数组中，`GRADE+i` 表示学号为`i+1` 的学生的成绩。另一个数组 `RANK` 为 30 个学生的名次表，其中 `RANK+i` 的内容是学号为 `i+1` 的学生的名次。编写一程序，根据 `GRADE` 中的学生成绩，将学生名次填入 `RANK` 数组中。(提示：一个学生的名次等于成绩高于这个学生的人数加1。)

* 27、已知数组 A 包含 15 个互不相等的整数，数组 B 包含 20 个互不相等的整数。试编制一程序把既在 A 中又在 B 中出现的整数存放于数组 C 中。

* 28、设在 A、B 和 C 单元中分别存放着三个数。若三个数都不是 0，则求出三数之和存放在 D 单元中；若其中有一个数为 0，则把其它两单元也清 0。请编写此程序。

* 29、试编写一程序，要求比较数组 `ARRAY中` 的三个 16 位补码数，并根据比较结果在终端上显示如下信息：  
(1) 如果三个数都不相等则显示0;  
(2) 如果三个数有二个数相等则显示1;  
(3) 如果三个数都相等则显示2。  

* 30、从键盘输入一系列字符(以回车符结束)，并按字母、数字、及其它字符分类计数，最后显示出这三类的计数结果。

* 31、已定义了两个整数变量 A 和 B ，试编写程序完成下列功能：  
(1) 若两个数中有一个是奇数，则将奇数存入A中，偶数存入B中;  
(2) 若两个数中均为奇数，则将两数加1后存回原变量;  
(3) 若两个数中均为偶数，则两个变量均不改变。  

* 32、假设已编制好 5 个歌曲程序，它们的段地址和偏移地址存放在数据段的跳跃表 `SINGLIST` 中。试编制一程序，根据从键盘输入的歌曲编号 1~5，转去执行五个歌曲程序中的某一个。

* 33、下面的程序段有错吗？若有，请指出错误。  
```asm
CRAY	PROC
PUSH	AX
ADD	    AX, BX
RET
ENDP	CRAY
```

* 34、写一段子程序 `SKIPLINES` ，完成输出空行的功能。空出的行数在 AX 寄存器中。

* 35、设有 10 个学生的成绩分别是 76，69，84，90，73，88，99，63，100 和 80 分。试编制一个子程序统计 60~69 分，70~79 分，80~89 分，90~99 分和 100 分的人数，分别存放到 S6，S7，S8，S9 和 S10 单元中。

* 36、编写一个有主程序和子程序结构的程序模块。子程序的参数是一个 N 字节数组的首地址 `TABLE`，数 N 及字符 `CHAR` 。要求在 N 字节数组中查找字符 `CHAR`，并记录该字符出现的次数。主程序则要求从键盘接收一串字符以建立字节数组 `TABLE`，并逐个显示从键盘输入的每个字符 `CHAR`以及它在 `TABLE` 数组中出现的次数。(为简化起见，假设出现次数 ≤ 15，可以用 16 进制形式把它显示出来。)

* 37、编写一个子程序嵌套结构的程序模块，分别从键盘输入姓名及 8 个字符的电话号码，并以一定的格式显示出来。  
主程序 `TELIST`:  
 * 显示提示符 `INPUT  NAME：`;  
 * 调用子程序 `INPUT_NAME` 输入姓名;  
 * 显示提示符 `INPUT  A  TELEPHONE  NUMBER：`;  
 * 调用子程序 `INPHONE` 输入电话号码;  
 * 调用子程序 `PRINTLINE` 显示姓名及电话号码。  
子程序 `INPUT_NAME`：  
 * 调用键盘输入子程序 `GETCHAR` ，把输入的姓名存放在 `INBUF` 缓冲区中;  
 * 把 `INBUF` 中的姓名移入输出行 `OUTNAME`。  
子程序 `INPHONE`:  
 * 调用键盘输入子程序 `GETCHAR` ，把输入的 8 位电话号码存放在 `INBUF` 缓冲区中;  
 * 把 `INBUF` 中的号码移入输出行 `OUTPHONE`。  
子程序 `PRINTLINE`：  
显示姓名及电话号码，格式为：  
```
NAME	TEL   
XXX		XXXXXXXX
```

* 38、编写子程序嵌套结构的程序，把整数分别用二进制和八进制形式显示出来。  
主程序 `BANDO` ：把整数字变量 `VAL1` 存入堆栈，并调用子程序 `PAIRS` ;  
子程序 `PAIRS` ：从堆栈中取出 `VAL1`；调用二进制显示程序 `OUTBIN` 显示出与其等效的二进制数；输出 8 个空格；调用八进制显示程序 `OUTOCT` 显示出与其等效的八进制数；调用输出回车及换行符子程序。  

* 39、假定一个名为 `MAINPRO` 的程序要调用子程序 `SUBPRO`，试问：  
(1) `MAINPRO` 中的什么指令告诉汇编程序 `SUBPRO` 是在外部定义的？  
(2) `SUBPRO` 怎么知道 `MAINPRO` 要调用它？  

* 40、定义宏指令 `FINSUM`：比较两个数 X 和 Y (X、Y为数，而不是地址)，若 X > Y 则执行 `SUM←X+2*Y`；否则执行 `SUM←2*X+Y`。

* 41、把下列C语句的语句改写成功能相同的汇编语言程序片段(其中：变量都为整型变量)。  
 * `h = (key & 0XFF00) >> 8;`  
 * `k = (k + '1' – 0xabcd) / 56;`
 * `for (i = s = 0; i < 100; i++) s += data[i]* 2;`
 * `for (s = 0, i = 100; i > 0; i--) s += i *2;`

* 42、把下列C语言的语句改写成等价的汇编语言程序段(不考虑运算过程中的溢出)。其中：变量a、b和c都是有符号的整型(int)变量。
```c
    if (a<1 || b/4 > 10 && c%8==5) {
        a = 20+b++;
        c <<= 2;
    }
    else {
        a = 21-(++c);
        b--;
    }
```

* 43、假设内存单元中有三个字 a、b和 c，编写一个程序，它可判断它们能否构成一个三角形，若能，CF 为 1，否则，CF 为 0。

* 44、假设有二十个无符号字存放在以 `Buffer` 为开始的缓冲区中，编写一个程序把它们从低到高排序。

* 45、编写一个程序，它把 CH 和 CL 中的二进制位依次交叉存入 AX 中。

* 46、编写一个程序，求出从内存单元 `1000:0000` 开始的 1024 个字的 32 位累加和，并把该值存入程序中的变量 Data 中。

* 47、用双重循环把下三角乘法表存入从 `product` 开始的 45 个字节中。

* 48、表示源程序结束的伪指令是什么？在其后所编写的指令在被汇编吗？

* 49、汇编语言程序一定会从代码段的第一条指令开始执行吗？如果不是，如何指定程序的入口地址？

* 50、编写一个程序，它把字符串 String 两端的空格和数字字符删除(字符串以 `$` 结束)。

* 51、编写子程序实现下列功能，参数的传递方式可自行决定(假设所有变量都是字类型)。
 * `abs(x) = |x|`
 * `f(x) = x^2+ 5x – 8`
 * `strlen(String)`

* 52、为什么要区分IRET指令与RET指令?

* 53、编写一个控制光标位置和形状的程序，该程序具有以下功能：
 * 可用光标移动键 ↑ 、 ↓ 、 ← 和 → 来移动光标；
 * 当光标已在第 0 列，且按 ← 键时，光标定在上一行的最后一列；若已在屏幕的左上角，则光标不动，且给出响铃；按 → 键时的边界处理类似；
 * 当光标在第 0 行，且按 ↑ 键时，则光标不动，且给出响铃；按 ↓ 键时的边界处理类似；
 * 按 Home 或 End 键，则光标移到当前行的行首或行尾；
 * 若按下数字或字母键，则把该字符从当前位置依次显示到屏幕顶（在新位置显示字符时，原位置的符号被抹去）；
 * 按 `Esc` 键，程序结束。

* 54、假设显示器的显示模式设定为 12H ，编写实现下列功能的程序：
 * 在屏幕中间从上到下显示一条明亮的蓝色线，线宽为1个像素；
 * 在屏幕底下横向画一条绿色线，线宽为 2 个像素；
 * 在屏幕上垂直显示 16 种颜色，每种颜色宽 40 个像素；
 * 设定屏幕背景为白色，在屏幕中间画一条青色线，线宽为 10 个像素。

* 55、编写程序，检测计算机是否已安装了鼠标，并以显示Yes/No来表示检测结果。

* 56、编写程序，显示鼠标的按键，若按左键，显示 `Left` ，若按右键，显示 `Right` ，按 `Esc` 键，程序结束。

* 57、编写一个程序，在图形模式下，打开鼠标，并显示鼠标的位置。

* 58、编写一个程序，显示驱动器 C 根目录下所有 EXE 文件（提示：用通配符"*.exe"来查找与此匹配的文件名，找到后，显示之）。

* 59、编写一个程序，显示驱动器 C 根目录下的所有子目录。

* 60、编写一个程序，设置指定目录下的所有文件为只读文件。

* 61、编写一个程序，创建一个隐含文件 `Data.TXT`。

* 62、编写一个程序，把键盘上输入写入文件 `File.dat` 中，类似以下 DOS 命令：
```
COPY con File.dat
```

* 63、编写一个宏，它产生 n 条 NOP 指令，其中n是宏的形式参数。

* 64、编写只有一个形式参数的宏PRINT，其具体功能如下（提示：用 IFB 或 IFNB 语句来测试是否有参数）：
 * 若引用时带有参数，则在屏幕上显示其参数字符，如：`PRINT 'A'`，则显示字符 'A'；
 * 若引用时不带实参，则显示回车和换行，如：`PRINT`。

* 65、编写一个在屏幕上连续显示 `Welcome…` 的信息，要求显示颜色和显示位置都是随机的。在新位置显示时，原位置的信息抹去。当按任意键时，程序结束运行。

* 66、从键盘输入一个表示年份的正整数（1 ~ 65535），然后判断其是否为闰年。若是，则输出 `Yes`，否则，输出 `No`。

* 67、编写一个带命令行参数的程序 Words ，输出指定正文文件中的单词，假设单词为连续的字母串。比如：`words file.txt`，显示文件 `file.txt` 中的每个单词

* 68、编写一个建立双向链表的程序，每接受一个整数，链表增加一个结点，当遇到负数时，结束链表结点的增加，然后从表尾向前输出各结点中的数值。

* 69、编写一个带命令行参数的程序 Calc ，其命令行参数是一些整数，程序输出它们之和。如果某参数为非法整数，则忽略之。比如：`Calc 120 +34 -56`，则程序显示 98。

* 70、在 68 的基础上，在不考虑运算符优先级的情况下，实现一个可进行算术四则运算（只有加、减、乘和除，没有括号等）的计算器。

* 71、编写一个简单的加密程序，它把一个文件中的所有字母字符按下列规律进行转换，非字母的字符保持不变。转换规律：'A' → 'Z'，'B' → 'Y'，……。

* 72、编写一个程序，它可显示 BMP 的图形文件。

* 73、编写一个程序，它可显示 JPG 的图形文件。

* 74、编写一个程序，求出 2 ~ 100 之内的所有素数。

## 参与者列表

**感谢以下成员对此习题集做出的分享和贡献！**
* [Forec](https://github.com/Forec)
* [non1996](https://github.com/non1996)
* [Occupying](https://github.com/Occupying)

# License
All codes in this repository are licensed under the terms you may find in the file named "LICENSE" in this directory.
