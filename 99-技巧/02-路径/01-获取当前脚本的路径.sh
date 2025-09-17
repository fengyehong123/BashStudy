#!/usr/bin/env bash

# 获取当前脚本的绝对路径
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
# 根据脚本的绝对路径获取脚本所在目录的绝对路径
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

# 打印脚本所在的文件夹路径
echo "$SCRIPT_DIR"
# 打印脚本所在的绝对路径
echo "$SCRIPT_PATH"