#!/usr/bin/env bash

function func2() {

    # BASH_SOURCE[0] 返回当前脚本的名称
    echo "func2: BASH_SOURCE0 is ${BASH_SOURCE[0]}"  # func2: BASH_SOURCE0 is 04-lib2.sh

    # func2函数 被 04-lib1.sh中的func1函数调用，所以 BASH_SOURCE[1] 打印出 04-lib1.sh
    echo "func2: BASH_SOURCE1 is ${BASH_SOURCE[1]}"  # func2: BASH_SOURCE1 is 04-lib1.sh

    # 因为在整个调用栈上，04-lib1.sh脚本 又被 04-环境变量_BASH_SOURCE.sh脚本 调用，所以 BASH_SOURCE[2] 打印出 04-环境变量_BASH_SOURCE.sh
    echo "func2: BASH_SOURCE2 is ${BASH_SOURCE[2]}"  # func2: BASH_SOURCE2 is e:\My_Project\BashStudy\12-脚本除错\04-环境变量_BASH_SOURCE.sh
}