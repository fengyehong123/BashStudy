#!/usr/bin/env bash

# 定义一个函数,判断sh脚本的执行环境,获取返回值
function detect_os() {
    
    # 通过【uname -s 】来判断
    local unameOut="$(uname -s)"

    case "$unameOut" in
        Linux*)
            echo "linux"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            echo "git_bash_Windows"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# 调用函数, 获取返回值
#     bash脚本的返回值一般用 echo 输出之后, 然后在调用处使用 $() 进行捕获
#     return <数字> → 只能返回 0–255 的整数（通常作为退出状态码使用）
os_type=$(detect_os)
echo "$os_type"