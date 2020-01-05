# 编译Linux源码

## 一. 下载内核源码（这里使用清华大学镜像源）

- 下载地址
[Linux内核](https://mirrors.tuna.tsinghua.edu.cn/kernel/)

- 解压

## 二. 安装编译文件需要的软件

- 修改源（ubuntu系统）

Ubuntu 的软件源配置文件是`/etc/apt/source-list`。将系统自带的该文件做个备份，将该文件替换为[这里的内容](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)，即可使用 TUNA 的软件源镜像。

- 安装必须的软件

```sh
sudo apt-get install libelf-dev
sudo apt-get install libssl-dev
```

## 三. 编译内核

### 3.1 清理文件(在linux源码根目录)

- 编译前清理

```sh
make clean      # 只清理所有产生的文件
make mrproper   # 清理所有产生的文件与config配置文件
make distclean  # ß清理所有产生的文件与config配置文件，并且编辑过的与补丁文件
```

### 3.2 配置(收集硬件信息如cpu型号，网卡等...)

- 编译配置, 四种方法选一种， 推荐第二种

```sh
make config         # 基于文本模式的交互配置
make menuconfig     # 基于文本模式的菜单模式(推荐使用)
make oldconfig      # 使用已有的.config,但会询问新增的配置项
make xconfig        # 图形化的配置(需要安装图形化系统)
```

1) 使用make menuconfig操作方法：

```txt
    1> 按y:编译>连接>镜像文件
    2> 按m:编译
    3> 按n:什么都不做
    4> 按"空格键":y,n轮换
```

配置完并保存后会在linux源码根目录下生成一个.config文件

2) 利用已有的配置文件模板(.config)

```txt
1> linux源码根目录/arch/<cpu架构>/configs/<具体某一的CPU文件>，把里面对应的文件copy并改名为.config至linux源码根目录下

2> 利用当前运行已有的文件(要用ls /boot/ -a查看)把/boot/config-2.6.18-53.e15拷贝并改名为.config至linux源码根目录下执行以上操作就可以用make menuconfig在拷贝.config文件上面修改文件了
```

### 3.3 编译内核

- 编译启动镜像

```sh
make bzImage -j 8
```

- 编译模块

```sh
make modules -j 8
```

### 3.4 安装内核

- 安装模块

```sh
make modules_install
```

- 安装内核

```sh
make install
```

### 3.5 更改启动grub

- 查看当前

```sh
$ cat /proc/version  
Linux version 4.10.0-35-generic (buildd@lcy01-33) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #39~16.04.1-Ubuntu SMP Wed Sep 13 09:02:42 UTC 2017

$cat /boot/grub/grub.cfg | grep 4.10
....
```
