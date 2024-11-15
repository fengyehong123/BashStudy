#!/usr/bin/env bash

echo "产生的随机数字为: $RANDOM"

# 🔴随机密码方式1
echo "产生的随机密码为: $(echo $RANDOM | md5sum | cut -c 1-8)"

# 🔴随机密码方式2
echo "产生的随机密码为: $(openssl rand -base64 8)"