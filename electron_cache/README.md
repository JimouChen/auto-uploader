# 手动下载Electron二进制文件指南

- 由于可能出现网络问题，为了帮助electron-builder跳过下载步骤，可能需要手动下载Electron二进制文件并放置在正确的位置。

## 步骤如下：

1. **下载文件**
   请下载以下文件：
   - https://github.com/electron/electron/releases/download/v38.2.1/electron-v38.2.1-darwin-arm64.zip

2. **放置文件**
   将下载的zip文件直接放入此目录（electron_cache）中。

3. **不需要重命名**
   保持原始文件名不变：`electron-v38.2.1-darwin-arm64.zip`

4. **运行打包命令**
   完成上述步骤后，您可以运行以下命令开始打包：
   ```bash
   npm run dist:mac
   ```

## 注意事项
- 请确保文件下载完整，不要解压文件
- 如果打包时仍然提示下载，请检查文件名和路径是否正确
- 此配置基于package.json中的electronDownload设置