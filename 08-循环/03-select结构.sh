#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹select 结构
# select结构主要用来生成简单的菜单。语法与for...in循环基本一致。
#
# select name [in list]; do
#   commands
# done
# 
# Bash 会对select依次进行下面的处理。
#   1. select生成一个菜单，内容是列表list的每一项，并且每一项前面还有一个数字编号。
#   2. Bash 提示用户选择一项，输入它的编号。
#   3. 用户输入以后，Bash 会将该项的内容存在变量name，该项的编号存入环境变量REPLY。
#      如果用户没有输入，就按回车键，Bash 会重新输出菜单，让用户选择。
#   4. 执行命令体commands。
#   5. 执行结束后，回到第一步，重复这个过程。
# ---------------------------------------------------------------------------------------------------

echo "选一个要执行的操作"
select service in {退出系统,中文,中国語,英文,世界}; do

    # 当 service 变量有值，说明用户选择的操作在 【退出系统,中文,中国語,英文,世界】 这个范围内
    if [[ -n "${service}" ]]; then
        echo "用户选择的服务是: $service"
    fi

    # ⏹select可以与case结合，针对不同项，执行不同的命令。
    case "$service" in
        退出系统 )
            echo '退出系统'
            break
            ;;
        中文 | 中国語 )
            echo '使用中文系统...'
            break
            ;;
        英文 )
            echo '使用英文系统...'
            break
            ;;
        世界 )
            echo '使用世界系统...'
            # 因为没有加 break，所以select菜单会再一次出现
            ;;
        * )
            echo '本系统未提供该服务，退出...'
            break
            ;;
    esac

done