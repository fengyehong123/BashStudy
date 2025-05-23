#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------
# ⏹set -o pipefail
# set -e 虽然可以使脚本只要发生错误时，终止执行。
# 但不适用于管道命令
# 
# 开启 set -e 之后，像下面这种情况，echo命令确实不会执行
# not_exit_command
# echo 'Hello World!'
# 
# 但如果是下面这种管道符的话，echo命令还是会执行的
# not_exit_command | echo 'Hello World!'
# ----------------------------------------------------------------------------------------------------

set -e

# shellcheck disable=SC2216
# ------------------------------------------------------------
# ⏹管道命令，就是多个子命令通过管道运算符（|）组合成为一个大的命令。
# Bash 会把最后一个子命令的返回值，作为整个命令的返回值。
# 也就是说，只要最后一个子命令不失败，管道命令总是会执行成功，
# 因此它后面命令依然会执行，set -e就失效了。
# ------------------------------------------------------------
not_exit_command | echo 'Hello World!'
echo '1. 我执行了。。。'

set -o pipefail
# shellcheck disable=SC2216
not_exit_command | echo '你好 世界!'
# 🔴可以看到，开启了 set -o pipefail 之后，下面的这行echo命令就没有执行，脚本就此终止
echo '2. 我执行了。。。'