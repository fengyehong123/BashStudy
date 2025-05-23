#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹if关键字后面，跟的是一个命令。这个命令可以是test命令，也可以是其他命令。
# 命令的返回值为 0 表示判断成立，否则表示不成立。
# 因为这些命令主要是为了得到返回值，所以可以视为表达式。
# ---------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------
# ⏹文件判断
# [ -e file ]
#            如果 file 存在，则为true。
# [ -f file ]
#            如果 file 存在并且是一个普通文件，则为true。
# [ -s file ]
#            如果 file 存在且其长度大于零，则为true。
# [ -L file ]
#            如果 file 存在并且是一个超链接，则为true。
# [ -r file ]
#            如果 file 存在并且可读（当前用户有可读权限），则为true。
# [ -w file ]
#            如果 file 存在并且可写（当前用户拥有可写权限），则为true。
# [ -x file ]
#            如果 file 存在并且可执行，则为true。
# 🔴[ -d folder ]🔴
#            如果 folder 存在并且是一个目录，则为true。
# ---------------------------------------------------------------------------------------------------
file_path='./README.md'

# ----------------------------------
# 💥注意点
# 1. $FILE要放在双引号之中，这样可以防止变量$FILE为空，从而出错。
# 2. $FILE如果为空，这时[ -e $FILE ]就变成[ -e ]，这会被判断为真。
# 3. $FILE放在双引号之中，[ -e "$FILE" ]就变成[ -e "" ]，这会被判断为伪。
# ----------------------------------
if [[ -d "$file_path" ]]; then
    echo '文件夹存在...'
elif [[ -e "$file_path" ]]; then
    # 判断文件是否可读写
    if [[ -r "$file_path" ]] && [[ -w "$file_path" ]]; then
        echo "文件可读可写!"
    else
        echo '文件无法读写!'
    fi
else
    echo '指定的文件/文件夹不存在!'
fi