#!/usr/bin/env bash

# -------------------------------------------------------------
# set命令的几个参数，一般都放在一起使用。
# 一般有如下两种写法，这两种写法建议放在所有 Bash 脚本的头部。
# -------------------------------------------------------------

# 写法1
set -Eeuxo pipefail

# 写法2
set -Eeux
set -o pipefail

echo 'Hello World!'

# 🔴另一种办法是在执行 Bash 脚本的时候，从命令行传入这些参数。
cd 11-set命令 || exit 1
bash -euxo pipefail 01-u选项.sh