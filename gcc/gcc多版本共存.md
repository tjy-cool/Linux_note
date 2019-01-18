# ubuntu16.04 安装gcc4.4.7  多版本共存

## 步骤一： 增加apt-get源

```sh
# vim 打开源文件
vim /etc/apt/source.list

# 增加以下内容到最后
deb http://dk.archive.ubuntu.com/ubuntu/ trusty main universe
deb http://dk.archive.ubuntu.com/ubuntu/ trusty-updates main universe
```

## 步骤二： 更新

```sh
sudo apt-get update
```

## 步骤三： 安装g++4.4

安装4.4版本的gcc和g++：

```sh
sudo apt-get install gcc-4.4 gcc-4.4-multilib g++-4.4 g++-4.4-multilib
```

## 步骤四： 查看是否已经安装好

```sh
sh /usr/bin/gcc*

# 正常情况下会出现 /usr/bin/gcc-4.4
```

## 步骤五：设置多版本共存

- 设置gcc

输入以下指令进行多gcc版本共存的配置：

```sh
#由于需要的版本为低版本，所以我将低版本的优先级设的较高，后面的‘20’和‘10’代表优先级，他们只有相对大小，没有绝对的规定
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 20
#将系统中原本的高版本设为较低优先级
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
```

- 设置g++

同样输入以下指令进行g++的多版本共存配置：

```sh
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
```

## 步骤六： 随时切换多版本

但我们并没有将高版本删除，随时都可以切换回来，只是需要手动进行选择。输入以下命令进行gcc版本切换操作：

```sh
# 切换gcc，输入下面命令后依据提示输入选择号
sudo update-alternatives --config gcc

# 切换g++，输入下面命令后依据提示输入选择号
sudo update-alternatives --config g++
```

## 步骤七： 非必须，删除配置

```sh
sudo update-alternatives --remove gcc /usr/bin/gcc-4.9
sudo update-alternatives --remove g++ /usr/bin/g++-4.9
```
