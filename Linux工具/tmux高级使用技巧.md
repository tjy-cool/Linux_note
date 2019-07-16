# tmux高级使用

## 设置vi模式

配置~/.tmux.conf如下：

```sh
# set -g prefix ^g                        # <prefix> 激活控制台，(默认Ctrl+b)
# unbind ^b                               # 解绑 Ctrl+b
set-option -g status-utf8 on            # 开启状态栏的UTF-8支持
# cp mode
set-window-option -g mode-keys vi       # 复制模式中的默认键盘布局使用 vi
bind h select-pane -L                   # h 等于向左移动光标
bind j select-pane -D                   # j 向下移动光标
bind k select-pane -U                   # k 向上移动光标
bind l select-pane -R                   # l 向右移动光标

# 插件配置，注意需要支持
run-shell ~/.tmux/tmux-resurrect/resurrect.tmux
run-shell ~/.tmux/tmux-continuum/continuum.tmux
set -g @continuum-save-interval '60'
```

## 保存配置插件（Tmux Resurrect）

- 安装Resurrect

```sh
mkdir ~/.tmux
cd ~/.tmux
git clone https://github.com/tmux-plugins/tmux-resurrect.git
```

- 配置Resurrect

```sh
# 向.tmux.conf增加配置
echo "run-shell ~/.tmux/tmux-resurrect/resurrect.tmux" >> ~/.tmux.conf

# 重启配置文件
tmux source-file ~/.tmux.conf
```

- 使用

|      快捷键    |     功能    |
| :-----------: | :---------: |
| prefix Ctrl+s | 保存tmux配置 |
| prefix Ctrl+r | 恢复tmux配置 |

> 注： 在保存配置时，会出现`saving`字样

## 自动保存插件（Tmux Continuum）

```sh
cd ~/.tmux
# 下载插件
git clone https://github.com/tmux-plugins/tmux-continuum.git
# 写入到tmux.conf中
echo "run-shell ~/.tmux/tmux-continuum/continuum.tmux" >> ~/.tmux.conf
# 重启配置文件
tmux source-file ~/.tmux.conf
```

默认为15分钟备份一次，如果需要改为1小时，则执行下面的脚本

```sh
echo "set -g @continuum-save-interval '60'" >> ~/.tmux.conf
```
