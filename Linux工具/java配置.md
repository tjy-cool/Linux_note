# java环境配置

## 步骤一：下载

下载链接： [java.com](https://www.java.com/zh_CN/download/)

## 步骤二：配置

```sh
#########################################################################
#                              java                                     #
#########################################################################
JAVA_HOME=/opt/jdk1.8.0_191	# java 1.8.0
#JAVA_HOME=/opt/jdk1.7.0			# java 1.7.0
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH
```