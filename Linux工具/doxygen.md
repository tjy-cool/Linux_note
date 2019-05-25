## Linux下Doxygen安装及使用大全

### 一. 安装

#### 1. 源码安装
```sh
# 下载
wget http://www.stack.nl/~dimitri/doxygen/download.html

# 解压
tar xvfz doxygen-1.7.4.linux.bin.tar.gz
cd doxygen-1.7.4

# 编译及安装
./configure
make
make install
```

#### 2. 命令安装

ubuntu安装：
```sh
sudo apt-get install doxygen
sudo apt-get install graphviz
```

CentOS安装：
```sh
yum install doxygen
yum install graphviz
```

Mac安装：
```sh
brew install doxygen
brew install graphviz
```

### 二. 编写Doxygen可识别的注释

#### 1. 实用标记

|     标记      |            含义             |
| :--------     | :-----------------------  | 
|  @author      |   注释作者                 |
|  @date        |   注释日期                 |
|  @copyright   |   注释版权                 |
|  @struct      |   注释一个结构体            |
|  @union       |   注释一个联合体            |
|  @enum        |   注释一个枚举体            |
|  @fn          |   注释一个函数              |  
|  @var         |   注释一个变量.             |
|  @def         |   注释一个 #define.         |
|  @typedef     |   注释一个 type definition. |
|  @file        |   注释一个文件.             |
|  @namespace   |   注释一个命名空间.          |
|  @package     |   注释一个 Java package.    |
|  @interface   |   注释一个 IDL interface.   |

#### 2. 注释模板

本文采用的是Javadoc风格的注释，具体的注释模板如下：

##### a. 文件注释, 放于文件的开头

```c
/** 
 * @file     hello.h
 * @brief    This is a brief description. 
 * @details  This is the detail description. 
 * @author   author 
 * @date     date 
 * @version  A001 
 * @par Copyright (c):  
 *       XXX公司 
 * @par History:          
 *       version: author, date, desc\n 
 */
```

##### b. 函数注释, 放于函数声明前

```c
/**
 * This is a brief description.
 * This is a detail description.
 * @param[in]	inArgName input argument description.
 * @param[out]	outArgName output argument description. 
 * @retval	OK	成功
 * @retval	ERROR	错误 
 * @par 标识符
 * 		保留
 * @par 其它
 * 		无
 * @par 修改日志
 * 		XXX于201X-XX-XX创建
 */
```

##### c. 类型/宏定义注释，放于宏定义上方或者右侧

```c
/** Description of the macro */
#define XXXX_XXX_XX		0
```
或者

```c
#define XXXX_XXX_XX		0 ///< Description of the macro.
```

##### d. 枚举/结构体注释, 放于数据结构定义前

```c
/**
 * The brief description.
 * The detail description.
 */
typedef struct
{
	int var1;///<Description of the member variable
}XXXX;
```
##### e. 全局和静态变量

```c
/**  Description of global variable  */
int g_xxx = 0;
 
static int s_xxx = 0; ///<  Description of static variable
```

参考：
1. [Doxygen给C程序生成注释文档 - on_the_road - 博客园](https://www.cnblogs.com/fkpj/p/4537145.html)



