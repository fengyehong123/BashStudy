#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹-t参数
# 设置超时的秒数。
# 如果超过了指定时间，用户仍然没有输入，脚本将放弃等待，继续向下执行。
# ---------------------------------------------------------------------------------------------------
echo "输入一些文本 > "
# 🔴使用 -t 参数指定等待用户输入的时间是 3 秒
if read -r -t 3 response; then
    echo "用户已经输入了，输入的值为：$response"
else
    echo "用户没有输入"
fi

# ---------------------------------------------------------------------------------------------------
# ⏹环境变量TMOUT
# 和 -t 的作用相同，也可以指定等待用户输入的时间(单位为秒)
# ---------------------------------------------------------------------------------------------------
TMOUT=3

echo "输入一些文本 > "
read -r response

# 如果用户没有输入内容，则使用默认值
echo "${response:-这个是默认值啊}"

# ---------------------------------------------------------------------------------------------------
# ⏹-p参数
# 指定用户输入时的提示信息
# ---------------------------------------------------------------------------------------------------
read -r -p "请输入一些信息。。。 > " input_content
echo "${input_content:-用户还是没有输入信息。。。}"

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# ---------------------------------------------------------------------------------------------------
# ⏹-a参数
# 将用户的输入内容赋值给一个数组，从下标为零的位置开始
# ---------------------------------------------------------------------------------------------------

# 删除环境变量TMOUT，关闭自动超时功能
unset TMOUT

echo -n "输入三个参数，参数之间以空格分隔 > "
read -r -a people_arrry
# 打印第2个元素
echo "${people_arrry[1]}"

# ---------------------------------------------------------------------------------------------------
# ⏹-n参数
# 指定只读取若干个字符作为变量值，而不是整行读取。
# ---------------------------------------------------------------------------------------------------
echo -n "输入一大串内容 > "
# 🔴只能读取3个字符
read -r -n 3 content1
sleep 2

echo -e "\n$content1"

# ---------------------------------------------------------------------------------------------------
# ⏹-s参数
# 用户的输入不显示在屏幕上，这常常用于输入密码或保密信息。
# ---------------------------------------------------------------------------------------------------
echo -n "请输入密码 > "
# 🔴raw 模式，表示不把用户输入的反斜杠字符解释为转义字符。
read -r -s password
echo -e "\n$password"