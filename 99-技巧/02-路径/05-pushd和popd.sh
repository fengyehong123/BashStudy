#!/usr/bin/env bash

# ______________________________________________________________
# 🔴在 Bash 里，pushd 和 popd 是 目录堆栈命令，用来更方便地在多个目录之间切换。它们和 cd 的区别在于：
#   1. cd 只是单纯切换目录。
#   2. pushd/popd 会维护一个“目录栈”（stack），可以随时切换回来。
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# 定义项目目录
PROJECTS=(
    "$HOME/Desktop/cbc"
    "$HOME/Desktop/House"
    "$HOME/Desktop/Markdown"
)

# 显示项目列表
echo "请选择要进入的项目目录:"1
for i in "${!PROJECTS[@]}"; do
    echo "  $i) ${PROJECTS[$i]}"
done

# 用户输入选择
read -p "输入编号: " choice

# 检查输入是否有效
if [[ "$choice" =~ ^[0-9]+$ ]] && [[ $choice -lt ${#PROJECTS[@]} ]]; then
    # 🔴切换到对应的目录下
    pushd "${PROJECTS[$choice]}" >/dev/null || exit 1
    echo "已切换到: $(pwd)"
else
    echo "无效选择!"
    exit 1
fi

# 在这里可以执行项目相关的命令
echo -e "目录下的文件有:"
ls -l

# 🔴返回原目录
popd >/dev/null
echo "返回到原目录: $PWD"
