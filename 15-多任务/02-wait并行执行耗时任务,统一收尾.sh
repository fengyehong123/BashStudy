#!/usr/bin/env bash

echo -e "\e[1;31m------------脚本开始: $(date +%T)------------\e[0m"
# 由于使用了 & 所以任务是并发的，总耗时时间为最长任务的时间，5秒
(sleep 3; echo "【sleep 3】的任务结束") &
(sleep 5; echo "【sleep 5】的任务结束") &
(sleep 2; echo "【sleep 2】的任务结束") &
echo "后台任务已启动..."

# 等待所有任务完成
wait
echo -e "\e[1;31m------------脚本结束: $(date +%T)------------\e[0m"
echo "所有任务完成, 开始进行下一步处理..."

# 若干图片的url
urls=( https://www.itzmx.com/{1..5}.webp )

# 并发下载网络上的图片
for url in "${urls[@]}"; do
    curl -sLO "$url" &
done

# 等待所有下载完成
wait
echo "所有下载完成"