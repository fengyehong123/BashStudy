#!/usr/bin/env bash

# ⏹查找指定目录下失效的超链接
find ~/work -type l | while read -r link; do 
    if [ ! -e "$link" ]; then
        echo "失效的链接为: $link"
    fi
done