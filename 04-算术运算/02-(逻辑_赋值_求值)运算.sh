#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹$((...))支持以下的逻辑运算符
#    <：小于
#    >：大于
#    <=：小于或相等
#    >=：大于或相等
#    ==：相等
#    !=：不相等
#    &&：逻辑与
#    ||：逻辑或
#    !：逻辑否
#    expr1?expr2:expr3：三元条件运算符。
#                       若表达式expr1的计算结果为非零值（算术真），则执行表达式expr2，
#                       否则执行表达式expr3。
# ---------------------------------------------------------------------------------------------------

# 🔴如果逻辑表达式为真，返回1，否则返回0。
echo $((3 > 2))  # 1
echo $((3 > 5))  # 0
echo $(( (3 > 2) || (4 <= 1) ))  # 1

# 🔴三元运算符执行一个单独的逻辑测试。它用起来类似于if/then/else语句。
var1=100
# 因为 100 < 10，所以返回 0
echo $((var1 < 10 ? 1 : 0))  # 0

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# ---------------------------------------------------------------------------------------------------
# ⏹算术表达式$((...))可以执行赋值运算。
# ---------------------------------------------------------------------------------------------------
echo $((var2 = (10 + 2)))  # 12
echo "va2变量的值: ${var2}"  # 12

var3=100
echo $((var3 += 200))  # 300
echo "var3变量的值: ${var3}"  # 300

# ---------------------------------------------------------------------------------------------------
# ⏹$((...))内部的 , 是求值运算符，执行前后两个表达式，并返回后一个表达式的值。
# ---------------------------------------------------------------------------------------------------
echo $((var4 = 1 + 2, 3 * 4))  # 12
echo "var4变量的值: ${var4}"  # 3