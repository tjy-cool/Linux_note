## tmux 使用大全

### 一. 常用命令
|  命令                        |        用途      |
|:-----------                  | :---------------|
| tmux new　　                 | 创建默认名称的会话    |
| tmux new -s mysession　　    | 创建名为mysession的会话    |
| tmux ls　　                  | 显示会话列表    |
| tmux a　　                   | 连接上一个会话    |
| tmux a -t mysession　　      | 连接指定会话    |
| tmux detach                  | 断开当前会话   |
| tmux rename -t s1 s2　　     | 重命名会话s1为s2    |
| tmux kill-session　　        | 关闭上次打开的会话    |
| tmux kill-session -t s1　    | 关闭会话s1    |
| tmux kill-session -a -t s1　 | 关闭除s1外的所有会话    |
| tmux kill-server　　         | 关闭所有会话    |

### 二. 快捷键

#### 1. 常用快捷键

|  快捷键    |        用途      |
|:-----------| :---------------|
| prefix s　　| 列出会话，可进行切换    |
| prefix $　　| 重命名会话    |
| prefix d　　| 分离当前会话    |
| prefix D　　| 分离指定会话    |

#### 2. 窗口管理

|  快捷键    |        用途      |
|:-----------| :---------------|
| prefix c　　| 创建一个新窗口     |
| prefix ,　　| 重命名当前窗口     |
| prefix w　　| 列出所有窗口，可进行切换     |
| prefix n　　| 进入下一个窗口     |
| prefix p　　| 进入上一个窗口     |
| prefix l　　| 进入之前操作的窗口     |
| prefix 0~9| 　选择编号0~9对应的窗口     |
| prefix .　　| 修改当前窗口索引编号     |
| prefix '　　| 切换至指定编号（可大于9）的窗口     |
| prefix f　　| 根据显示的内容搜索窗格     |
| prefix &　　| 关闭当前窗口     |

#### 3. 窗格管理

|  快捷键    |        用途      |
|:-----------| :---------------|
| prefix %　　| 水平方向创建窗格    |
| prefix "　　| 垂直方向创建窗格    |
| prefix Up/Down/Left/Right　|　根据箭头方向切换窗格    |
| prefix q　　| 显示窗格编号    |
| prefix o　　| 顺时针切换窗格    |
| prefix }　　| 与下一个窗格交换位置    |
| prefix {　　| 与上一个窗格交换位置    |
| prefix x　　| 关闭当前窗格    |
| prefix space(空格键)　|　重新排列当前窗口下的所有窗格    |
| prefix !　　| 将当前窗格置于新窗口    |
| prefix Ctrl+o　|　逆时针旋转当前窗口的窗格    |
| prefix t　　| 在当前窗格显示时间    |
| prefix z　　| 放大当前窗格(再次按下将还原)    |
| prefix i　　| 显示当前窗格信息    |

#### 4. 其他命令

|  快捷键           |        用途      |
|:-----------       | :---------------|
| tmux list-key　   |　列出所有绑定的键，等同于prefix ?  |
| tmux list-command |　列出所有命令  |

- 注

> session 不可见，一个sesson可以有多个window, 且window可以在不同的session里移动
> window 可见，一个window可以有多个pane。

```sh
# 安装tmux
sudo yum install tux

# 运行tmux并开启一个新的会话
tmux

# 显示所有会话
tmux ls

# 新建会话并指定会话名称（建议制定会话名称，以便了解该会话用途）
tmux new -s <session-name>

# 新建会话（不指定会话名称）
tmux new

# 接入上一个会话
tmux a

# 接入指定名称的会话
tmux a -t <session-name>

# 断开当前会话（还可以使用快捷键：control+b，再按d）
tmux detach

# 关闭指定会话
tmux kill-session -t session-name

# 关闭除指定会话外的所有会话
tmux kill-session -a -t session-name

# 在会话中切换
control+b，再按s 显示会话列表，再进行会话切换

# 销毁所有会话并停止tmux
tmux kill-server
```