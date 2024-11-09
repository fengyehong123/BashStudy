#!/usr/bin/env bash

function func1() {

    # BASH_SOURCE[0] 返回当前脚本的名称
    echo "func1: BASH_SOURCE0 is ${BASH_SOURCE[0]}"  # func1: BASH_SOURCE0 is 04-lib1.sh

    # 因为 func1函数 本身是被「04-环境变量_BASH_SOURCE.sh脚本」调用的，所以 BASH_SOURCE[1] 打印出 04-环境变量_BASH_SOURCE.sh
    echo "func1: BASH_SOURCE1 is ${BASH_SOURCE[1]}"  # func1: BASH_SOURCE1 is e:\My_Project\BashStudy\12-脚本除错\04-环境变量_BASH_SOURCE.sh

    # 因为 func1函数 是被「04-环境变量_BASH_SOURCE.sh脚本」调用的，所以调用堆栈就截止到 04-环境变量_BASH_SOURCE.sh ，所以 BASH_SOURCE[2] 为空
    echo "func1: BASH_SOURCE2 is ${BASH_SOURCE[2]}"  # func1: BASH_SOURCE2 is

    func2
}