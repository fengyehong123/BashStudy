#!/usr/bin/env bash

# ⏹声明一个只读变量
readonly my_name='贾飞天'
# 尝试修改变量值
my_name='枫叶红'

# 可以看到，变量值无法被修改
echo $?  # 1
echo "${my_name}"  # 贾飞天

# ⏹定义一个函数，并设置为只读
print_info() {
    # shellcheck disable=SC2317
    echo "Hello Wolrd!"
}
readonly -f print_info

# 可以看到只读函数也是无法被修改的
print_info() {
    echo "你好，世界！"
}
echo $?  # 1

# ⏹定义一个只读数组
readonly my_arr=('地球' '月球' '火星')
my_arr[3]='金星'

# 可以看到，对数组的修改失败
echo $?  # 1
echo '数组的元素为：' "${my_arr[@]}"  # 数组的元素为： 地球 月球 火星