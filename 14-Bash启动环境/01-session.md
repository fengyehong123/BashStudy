# Session
用户每次使用 Shell，都会开启一个与 Shell 的 Session（对话）。
⏹Session 有两种类型
1. `登录Session` (login shell)
2. `非登录Session` (non-login shell)

# 登录Session
`登录Session` 是用户登录系统以后，系统为用户开启的原始Session，通常需要用户输入**用户名和密码**进行登录。
`登录Session` 一般进行整个系统环境的初始化，启动的初始化脚本依次如下。
**/etc/profile**
    所有用户的全局配置脚本。
**/etc/profile.d**
    目录里面所有.sh文件
**~/.bash_profile**
    用户的个人配置脚本。如果该脚本存在，则执行完就不再往下执行。
**~/.bash_login**
    如果`~/.bash_profile`没找到，则尝试执行这个`~/.bash_login`脚本（C shell 的初始化脚本）。
    如果该脚本存在，则执行完就不再往下执行。
**~/.profile**
    如果`~/.bash_profile`和`~/.bash_login`都没找到，则尝试读取这个`~/.profile`脚本。
    （Bourne shell 和 Korn shell 的初始化脚本）。

⚠️⚠️⚠️**注意事项**⚠️⚠️⚠️
Linux 发行版更新的时候，会更新`/etc`里面的文件，比如`/etc/profile`，因此不要直接修改这个文件。
如果想修改所有用户的登陆环境，就在`/etc/profile.d`目录里面新建`.sh`脚本。

👉👉👉**修改你个人登录环境**👈👈👈
一般是在`~/.bash_profile`里面进行修改

⏹`.bash_profile`的内容示例
```bash
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin
PATH=$PATH:$HOME/bin

SHELL=/bin/bash
MANPATH=/usr/man:/usr/X11/man
EDITOR=/usr/bin/vi
PS1='\h:\w\$ '
PS2='> '

# 如果 .bashrc 文件存在的话，就执行该文件
# 脚本定义了一些最基本的环境变量，然后执行了~/.bashrc
if [ -f ~/.bashrc ]; then
    # . 是source命令的简写方式
    . ~/.bashrc
fi

export PATH
export EDITOR
```

⏹bash命令的`--login`参数，会强制执行`登录Session`会执行的脚本
```bash
# 只是普通的执行 test.sh 脚本
bash test.sh
# 先执行一遍【登录Session】时会执行的脚本，然后在执行 test.sh 脚本
bash --login test.sh
```

⏹bash命令的`--noprofile`参数，会跳过上面这些 `Profile` 脚本
bash执行时，`--noprofile`参数是默认的情况
```bash
bash --noprofile test.sh
```

# 非登录Session
1. 非登录 Session 是用户进入系统以后，手动新建的 Session，这时不会进行环境初始化。
2. 在命令行执行`bash`命令，就会新建一个`非登录Session`。
```bash
# 注意，只是执行bash命令而已，没有其他的参数
bash
```

⏹非登录 Session 的初始化脚本依次如下
**/etc/bash.bashrc**
    对全体用户有效
**~/.bashrc**
    仅对当前用户有效

⚠️⚠️⚠️**注意事项**⚠️⚠️⚠️
1. 对用户来说，`~/.bashrc`通常是最重要的脚本。
`非登录Session`默认会执行它，而`登录Session`一般也会通过调用执行它。
2. 每次新建一个 Bash 窗口，就相当于新建一个`非登录Session`，所以`~/.bashrc`每次都会执行。
3. 执行脚本相当于新建一个`非互动的Bash环境`，但是这种情况不会调用`~/.bashrc`
```bash
# 不会调用 ~/.bashrc
bash test.sh
```

⏹bash命令的`--norc`参数，可以禁止在非登录 Session 执行`~/.bashrc`脚本
```bash
bash --norc
```


