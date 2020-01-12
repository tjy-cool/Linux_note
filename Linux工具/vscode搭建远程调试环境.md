# vocode搭建远程调试环境

## 安装vocode remote ssh

待完成

## 配置脚本

```js
// launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "gdb Remote Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "a.out",
            // "args": ["myarg1", "myarg2", "myarg3"],
            "args": [],
            "stopAtEntry": true,
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "sourceFileMap": {
                "./": "./"
            },
            // "miDebuggerPath": "gdb",
            // "miDebuggerArgs": "gdb",
            "linux": {
                "MIMode": "gdb",
                "miDebuggerPath": "/usr/bin/gdb",
                "miDebuggerServerAddress": "10.211.55.7:2333",
            },
            "logging": {
                "moduleLoad": false,
                "engineLogging": false,
                "trace": false
            },
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "cwd": "${workspaceFolder}",
        }
    ]
}
```
### 参考

[使用 VSCode 远程访问代码以及远程 GDB 调试](https://www.dazhuanlan.com/2019/10/15/5da5849a50fec/)