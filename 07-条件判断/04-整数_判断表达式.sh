#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹整数判断
# [ integer1 -eq integer2 ]
#            等于
# [ integer1 -ne integer2 ]
#            不等于
# [ integer1 -le integer2 ]
#            小于等于
# [ integer1 -lt integer2 ]
#            小于
# [ integer1 -ge integer2 ]
#            大于等于
# [ integer1 -gt integer2 ]
#            大于
# ---------------------------------------------------------------------------------------------------

INT=-5

# 🔴判断变量值是否存在
if [ -z "$INT" ]; then
    echo "INT变量的值为空" >&2
    exit 1
fi

# 🔴判断变量值是否为0
if [ "$INT" -eq 0 ]; then
    echo "INT变量的值为0"
    exit 1
fi

# 🔴判断变量值是否大于0
if [ $INT -lt 0 ]; then
    echo "INT变量是负数."
else
    echo "INT变量是正数."
fi

# 🔴判断变量值是奇数还是偶数
if [ $((INT % 2)) -eq 0 ]; then
    echo "INT变量是偶数."
else
    echo "INT变量是奇数."
fi