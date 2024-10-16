#!/usr/bin/env bash

welcome_info="默认值"
echo "${welcome_info}"  # 默认值

if (( 2 > 1)); then
    val='你好,世界'
else 
    val='Hello,World'
fi

# 动态为变量赋值
eval "welcome_info=${val}"
echo "${welcome_info}"  # 你好,世界

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# 动态生成变量
for i in {1..3}; do
    # 动态生成变量 var1, var2, var3
    eval "var$i=$i"  
done

# shellcheck disable=SC2154
echo "$var1"  # 1
# shellcheck disable=SC2154
echo "$var2"  # 2
# shellcheck disable=SC2154
echo "$var3"  # 3

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# echo命令的各部分选项拆解
echo_e_option_cmd="echo -e"
font_color_prefix="\e[1;31m"
font_color_suffix="\e[0m"

# 文件所在的路径
file_path='./01-变量/01-file/SYS_INfo.txt'
# 指定要读取的文件的行号
line_number=1

# ------------------------------------------------------------------------------------
# ⏹获取文件内容
# -F"="
#    指定使用 = 来分隔数据
# -v line="$line_number"
#    定义用于传递的变量
# ------------------------------------------------------------------------------------
file_content=$(awk -F"=" -v line="$line_number" 'NR==line {print $2}' $file_path)
echo "$file_content"  # 系统管理员

# 拼凑出完整的命令 \" 用于给选项添加 "
full_echo_cmd="${echo_e_option_cmd} \"${font_color_prefix}${file_content}${font_color_suffix}\""
echo "$full_echo_cmd"  # echo -e "\e[1;31m系统管理员\e[0m"

# 🔴执行动态拼接好的命令
eval "${full_echo_cmd}"