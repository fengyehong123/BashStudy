#!/usr/bin/env bash

# 初始化一个数组
arr1=('语文' '数 学' '英语')

# 数组拷贝
course_arry1=( "${arr1[@]}" )
for ele in "${course_arry1[@]}"; do
  echo "$ele"
done

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# 在数组拷贝的同时添加一个元素
course_arry2=( "${arr1[@]}" '地理')
for ele in "${course_arry2[@]}"; do
  echo "$ele"
done