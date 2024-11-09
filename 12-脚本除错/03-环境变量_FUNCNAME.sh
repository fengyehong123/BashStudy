#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------
# ⏹变量FUNCNAME返回一个数组，内容是当前的函数调用堆栈。
# 该数组的0号成员是当前调用的函数，1号成员是调用当前函数的函数，以此类推。
# ----------------------------------------------------------------------------------------------------

function func1() {

    # FUNCNAME[0] 返回当前函数的名称
    echo "func1: FUNCNAME0 is ${FUNCNAME[0]}"  # func1: FUNCNAME0 is func1
    # 因为 func1函数 本身是被bash脚本调用的，所以 FUNCNAME[1] 打印出 main
    echo "func1: FUNCNAME1 is ${FUNCNAME[1]}"  # func1: FUNCNAME1 is main
    # 因为 func1函数 是被bash脚本调用的，所以调用堆栈就截止到 main ，所以 FUNCNAME[2] 为空
    echo "func1: FUNCNAME2 is ${FUNCNAME[2]}"  # func1: FUNCNAME 2 is

    func2
}

function func2() {

    # FUNCNAME[0] 返回当前函数的名称
    echo "func2: FUNCNAME0 is ${FUNCNAME[0]}"  # func2: FUNCNAME0 is func2
    # func2函数 被 func1函数调用，所以 FUNCNAME[1] 打印出 func1
    echo "func2: FUNCNAME1 is ${FUNCNAME[1]}"  # func2: FUNCNAME1 is func1
    # 因为在整个调用栈上，func1函数又被bash脚本调用，所以 FUNCNAME[2] 打印出 main
    echo "func2: FUNCNAME2 is ${FUNCNAME[2]}"  # func2: FUNCNAME2 is main 
}

func1