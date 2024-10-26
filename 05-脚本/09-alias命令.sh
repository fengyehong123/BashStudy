#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹alias命令用来为一个命令指定别名，这样更便于记忆。
# 语法格式如下:
#     alias 别名名称=别名对应的原始命令
#
# ⏹在脚本中定义别名并尝试在同一脚本中立即调用它时，别名可能不会立即生效。
# 在非交互式 shell（例如脚本运行时）中，alias 默认不启用，除非显式启用。
#
# ⏹在脚本顶部启用别名扩展 使用 shopt -s expand_aliases 启用别名扩展，
# 使得脚本中定义的别名立即生效。
# ---------------------------------------------------------------------------------------------------

# 启用别名扩展
shopt -s expand_aliases

# -----------------------------------------------------------
# 🔴通过别名定义一个 today 的命令
# 此处只是为了测试，在脚本中，使用函数来代替别名会更加灵活
# 
# ⭐在实际使用过程中，一般会把常用的别名写在 ~/.bashrc 文件的末尾
# ⭐只能为命令定义别名，为其他部分（比如很长的路径）定义别名是无效的
# -----------------------------------------------------------
alias today='date +"%A, %B %-d, %Y"'

# 使用定义的别名来打印当前的日期
today

# 🔴直接调用 alias 命令，可以显示所有的别名
alias

# 🔴unalias命令可以解除别名
unalias today