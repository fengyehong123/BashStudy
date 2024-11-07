#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------
# ⏹set命令
# 1. Bash在执行sh脚本的时候，会创建一个子Shell，创建的这个子Shell就是脚本的执行环境
# 2. Bash默认给定了环境的各种参数
# 3. set命令用于定制环境，用来修改子Shell环境的运行参数
# 4. 如果不带任何参数，直接运行 set 命令的话，会显示所有的环境变量和Shell函数
# ----------------------------------------------------------------------------------------------------

# 🔴显示所有的环境变量和Shell函数
set | head

# ----------------------------------------------------------------------
# ⏹set -u
# 1. 执行脚本时，如果遇到不存在的变量，Bash 默认忽略它。
# 2. set -u 用于启用未定义变量检测模式
#    开启这个选项后，如果脚本中引用了未定义的变量，Shell 会报错并退出。
#    这样可以帮助发现和避免由于拼写错误或遗漏导致的未定义变量问题。
# 3. set +u：关闭未定义变量检测模式。
#    在这种模式下，如果引用了未定义的变量，Shell 会将其视为空字符串，不会报错。
# 4. set -u 还可以写作 
#       set -o nounset
# ----------------------------------------------------------------------

# shellcheck disable=SC2154
# ----------------------------------------------------------------------
# 1. $undefined_var 变量并不存在，echo "$undefined_var" 输出了一个空行，忽略了此错误
# 2. 大多数情况下，遇到变量不存在，脚本应该报错，而不是一声不响地往下执行。
# ----------------------------------------------------------------------
echo "$undefined_var"
echo "Hello World!"

# 🔴启用未定义变量检测模式，脚本中有未定义的变量，运行时程序会报错
set -u

echo "$undefined_var"
echo "你好，世界！"