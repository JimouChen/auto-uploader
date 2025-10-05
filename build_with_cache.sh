#!/bin/bash

# 确保electron_cache目录存在
echo "检查electron_cache目录..."
if [ ! -d "electron_cache" ]; then
  echo "创建electron_cache目录..."
  mkdir -p electron_cache
fi

# 检查Electron二进制文件是否已下载
echo "\n检查Electron二进制文件是否已下载..."
if [ -f "electron_cache/electron-v38.2.1-darwin-arm64.zip" ]; then
  echo "✅ 找到了electron-v38.2.1-darwin-arm64.zip文件"
else
  echo "❌ 未找到electron-v38.2.1-darwin-arm64.zip文件"
  echo "请按照electron_cache/README.md中的指南手动下载此文件"
  echo "下载链接: https://github.com/electron/electron/releases/download/v38.2.1/electron-v38.2.1-darwin-arm64.zip"
  echo "下载后请将文件放入electron_cache目录"
  exit 1
fi

# 设置代理环境变量
echo "\n设置代理环境变量..."
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=http://127.0.0.1:7890
echo "✅ 代理设置完成"

# 运行electron-builder打包命令，指定Electron缓存目录
echo "\n开始使用electron-builder打包应用..."
echo "使用本地缓存的Electron二进制文件"
npx electron-builder --mac --config.electronDownload.cacheDir=electron_cache --config.electronDownload.useDownloadCache=true

# 检查打包结果
if [ $? -eq 0 ]; then
  echo "\n✅ 打包成功!"
  echo "应用已打包到: dist/目录下"
else
  echo "\n❌ 打包失败!"
  echo "请检查错误信息，可能需要查看electron-builder的日志以获取更多详细信息"
  exit 1
fi