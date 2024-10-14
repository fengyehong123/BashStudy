#!/usr/bin/env bash

echo '06-z_children.sh 执行了'

# 子shell中并没有定义 name1 和 name2 这两个变量
# 对子shell来说，name1 和 name2 是环境变量
# 且 这两个变量来自于父shell
echo "${name1}"
echo "${name2}"