#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------
# ⏹追加数组成员
# 1. 获取数组的最大长度，然后通过下标的方式进行追加。😵比较麻烦。😵
# 2. 数组末尾追加成员，可以使用+=赋值运算符。它能够自动地把值追加到数组末尾。
# ----------------------------------------------------------------------------------------------------

# 初始化一个数组
arr_a=('AA' 'BB' 'CC')

# 获取数组的最大长度
max_length="${#arr_a[@]}"

# ⏹追加一个元素到末尾
arr_a[max_length]='DD'
echo "${arr_a[@]}"  # AA BB CC DD

# ⏹追加一个元素到末尾
arr_a+=('EE')
echo "${arr_a[@]}"  # AA BB CC DD EE

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# ----------------------------------------------------------------------------------------------------
# ⏹删除数组
# 使用 unset命令删除数组中的指定成员
# ----------------------------------------------------------------------------------------------------

# 🔴删除数组中的下标为2的元素
unset "arr_a[2]"
echo "${arr_a[@]}"  # AA BB DD EE

# ------------------------------------------------
# 🔴将某个成员设为空值，可以从返回值中“隐藏”这个成员。
# ------------------------------------------------
arr_a[0]=''
for ele in "${arr_a[@]}"; do
    echo "元素的值: $ele"
done
# 元素的值:
# 元素的值: BB
# 元素的值: DD
# 元素的值: EE

# ⏹由上的例子可以看到，成员只是变成空字符串被隐藏了，并不是被删除了
# ⏹由下面的echo结果也可以看到，元素对应的下标其实还存在
echo "${!arr_a[@]}"  # 0 1 3 4

# ❌❌❌由于空值就是空字符串，所以下面这样写也有隐藏效果，但是不建议这种写法。❌❌❌
arr_a[0]=''

# 为0下标的元素重新赋值
arr_a[0]='AA'
echo "${arr_a[@]}"  # AA BB DD EE

# shellcheck disable=SC2178
# 直接将数组变量赋值为空字符串，相当于“隐藏”数组的第一个成员。
arr_a=''
for ele in "${arr_a[@]}"; do
    echo "元素的值: $ele"
done
# 元素的值:
# 元素的值: BB
# 元素的值: DD
# 元素的值: EE

# ------------------------------------------------
# 🔴unset ArrayName
#    可以清空整个数组。
# ------------------------------------------------
# 清空整个数组
unset arr_a
echo "数组的长度为: ${#arr_a[@]}"  # 数组的长度为: 0