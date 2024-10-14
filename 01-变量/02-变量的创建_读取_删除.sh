#!/usr/bin/env bash

# ⭕Bash 没有数据类型的概念，所有的变量值都是字符串。

# ⏹变量由数字，字母，下划线组成。变量的第一个字母不能是数字
# ⭕等于号的两侧不能有空格，这一点和其他编程语言很不一样
my_name="fengyehong"

# ⏹变量值可以引用其他变量的值
my_var1="你好，我的名字是 $my_name"
echo "$my_var1"

# ⏹变量的值可以是其他命令的执行结果
my_result1=$(find ./ -name "*.sh" | wc -l)
echo "$my_result1"

# ⏹变量值可以是数学运算的结果
my_num=$((5 * 7))
echo "${my_num}"

# ⏹可以在一行同时定义多个变量，使用分号 ; 分隔即可
my_var2=110;my_var3=120;
echo "${my_var2}和$my_var3是必须的"  # 110和120是必须的

echo '🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴分割线🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴'

# ⏹变量的读取
# ⏹给变量加上 $ 之后，就可以直接读取了
echo "数值是:$my_var2"  # 数值是:110

# ⏹如果变量不存在并不会报错，只是会输出空
# shellcheck disable=SC2154
echo "数值是:$my_var2_file"

# ⏹读取变量的时候，变量名也可以使用花括号{}包围，可以用于变量名与其他字符连用的情况。
# bash将 my_name_file 作为一个整体看待了，其实我们的变量名只是 my_name
# shellcheck disable=SC2154
echo "文件名的模板是: $my_name_file.txt"  # 文件名的模板是: .txt
# 通过 ${} 来包裹变量名，可以正确进行输出
echo "文件名的模板是: ${my_name}_file.txt"  # 文件名的模板是: fengyehong_file.txt

# 将my_num这个变量值本身也是一个变量
my_num1=my_num
# 可以看到如果变量值本身是变量的话，并不会输出最终的值
echo "${my_num1}"  # my_num
# ⏹使用 ${!varname} 的语法，可以读取到最终的值
echo "${!my_num1}"  # 35

echo '🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴分割线🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴'

# 定义3个变量
my_var22=110110;my_var33=120120;my_var44=119119;
echo "${my_var22}"

# ⏹unset命令用来删除变量
# 这个命令不是很有用。因为不存在的 Bash 变量一律等于空字符串，所以即使unset命令删除了变量，还是可以读取这个变量，值为空字符串。
unset $my_var22
# 验证变量删除成功
echo $?  # 0

# ⏹删除一个变量，也可以将这个变量设成空字符串。
echo "${my_var33}_${my_var44}"  # 120120_119119
my_var33=''
my_var44=
echo "${my_var33}_${my_var44}"  # _