#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹关联数组
# 从 Bash 4.0 开始，Bash 支持关联数组。
# 关联数组允许你将键和值配对，并通过键来访问值，类似于其他编程语言中的 Map。
#
# ⏹创建关联数组
# declare -A 关联数组名称      
# ---------------------------------------------------------------------------------------------------

# --------------------------
# 🔴创建一个关联数组
# --------------------------
declare -A personMap=(
    [name]="贾飞天"
    [age]=18
    [address]='地球'
)

# ⏹根据key访问对应的value
echo "${personMap["name"]}"  # 贾飞天

# key也可以是个变量
mykey="age"
echo "${personMap[$mykey]}"  # 18

# --------------------------
# 🔴元素的添加
# --------------------------
personMap["car"]="红旗"
echo "${personMap["car"]}"  # 红旗

# 获取所有的key
echo "${!personMap[@]}"  # address age car name

# --------------------------
# 🔴元素的删除
# --------------------------
# 删除指定的key
unset "personMap['car']"

# 元素删除后，获取所有的key
echo "${!personMap[@]}"  # address age name

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# --------------------------
# 🔴元素键值对的获取与遍历
# --------------------------
# 遍历键
echo "${!personMap[@]}" | xargs -n 1
# address
# age
# name

# 遍历值
echo "${personMap[@]}" | xargs -n 1
# 地球
# 18
# 贾飞天

# --------------------------
# 🔴遍历整个关联数组
# --------------------------
for key in "${!personMap[@]}"; do
    echo "$key: ${personMap[$key]}"
done
# address: 地球
# age: 18
# name: 贾飞天

# --------------------------
# 🔴实际应用
# --------------------------

# 将系统信息收集到关联数组中
declare -A sysinfo=(
    [hostname]=$(hostname)
    [os]=$(uname -o)
    [kernel]=$(uname -r)
)

# 输出系统信息
for key in "${!sysinfo[@]}"; do
    echo "$key: ${sysinfo[$key]}"
done

# hostname: MingWei-HP
# kernel: 3.4.10-87d57229.x86_64
# os: MingWei-HP