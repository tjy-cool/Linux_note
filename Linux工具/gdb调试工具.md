# gdb 调试工具使用大全

## 一、常用命令

|   命令    | 命令缩写 |   命令说明     |
| :-------: | :---:  | :----------- |
| list      |   l     |   显示多行源代码      |
| break fun |   b fun |   设置断点 |
| break N   |   b N   |   在第n行打断点 |
| break file.c:N    | b file.c:N    | 在当前源文件file.c的第N行设置断点 |
| break classA::fun | b classA::fun | 在classA的fun函数处设置断点
| break if  |   b if  |   当满足某个条件时停止 |
| delete N  |   d N   |   删除断点（包括watch 点），一般先使用info命令查看断点，之后使用d 断点号删除 |
| disable   |         |   禁用断点 |
| enable    |         |   允许断点 |
| info      |   i     |   描述程序状态，比如： i b 显示有哪些断点，i th 哪些线程 |
| run       |   r     |   开始运行程序 |
| display   |   disp  |   跟踪查看某个变量，每次停下来都显示其值 |
| print     |   p     |   打印内部变量值 |
| watch     |         |   监视变量值新旧的变化 |
| step N    |   s N   |   执行下N条语句，如果该语句为函数调用，则进入函数执行第N条语句 |
| next      |   n     |   执行下一条语句,如果该语句为函数调用,不会进入函数内部执行(不会一步步地调试函数内部语句） |
| continue  |   c     |   继续程序的运行，直到遇到下一个断点 |
| finish    |         |   如果进入了某个函数，返回到调用调用它的函数，jump out |
| set var name = v |  |    设置变量的值 |
| backtrace |   bt    |   查看函数调用信息（堆栈） |
| start     |   st    |   开始执行程序，在main函数中的第一条语句前停下 |
| frame     |   f     |   查看栈帧，比如 frame 1 查看1号栈帧 |
| quit      |   q     |   离开gdb |
| edit      |         |   在gdb中进行编辑 |
| whatis    |         |   查看变量的类型 |
| search    |         |   搜索源文件中的文本 |
| file      |         |   装入需要调试的程序 |
| kill      |   k     |   终止正在调试的程序 |

## 二、其他命令

### 2.1 tui界面

- 启动使用设置

```sh
gdb -tui test
```

- 已经在gdb界面中， `ctrl+x, ctrl+a`切换tui界面。

- 界面切换

```sh
info win    # 查看当前的focus，有src和cmd两种
fs next     # 上下切换focus
fs src      # 切换到指定的focus
```

- layout切换

```sh
# 直接查询帮助命令
help layout

# layout_name 可以是 src, asm, split, regs
layout prev | next | <layout_name>
```

- 线程调试

```sh
info threads    # 显示当前可调试的所有线程，每个线程会有一个GDB为其分配的ID，后面操作线程的时候会用到这个ID。 前面有*的是当前调试的线程。
thread ID       # 切换当前调试的线程为指定ID的线程。
break thread_test.c:123 thread all  # 在所有线程中相应的行上设置断点
thread apply ID1 ID2 command        # 让一个或者多个线程执行GDB命令command。 
thread apply all command            # 让所有被调试线程执行GDB命令command。

# 默认值off-->不锁定任何线程
# on-->只有当前被调试程序会执行
# step 在单步的时候，除了next过一个函数的情况(熟悉情况的人可能知道，这其实是一个设置断点然后continue的行为)以外，只有当前线程会执行。
set scheduler-locking off|on|step
```

```sh
# 附着线程
ps -Tef | grep (程序名)  # -T为显示所有线程
gdb attach thID         # 附着线程进行调试
```

## 三、脚本

待完成

#### 参考

1. [GDB常用命令与技巧（超好用的图形化gdbgui）](https://blog.csdn.net/songchuwang1868/article/details/86132281)
2. [gdb调试脚本](https://blog.csdn.net/cnsword/article/details/16337031)
