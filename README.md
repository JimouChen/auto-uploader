# 文件上传客户端

- 一款基于Electron开发的桌面文件上传工具，提供简洁直观的界面，支持多环境配置和批量文件上传功能。

<img width="1147" height="712" alt="image" src="https://github.com/user-attachments/assets/75226246-00e1-42d2-afba-061e3472ac7f" />


## 功能特性

### 基础功能
- 📁 **文件和文件夹上传**：支持单个文件或整个文件夹的上传
- 🔧 **多环境支持**：内置开发环境、测试环境、生产环境三种预设配置
- 🔐 **灵活的认证方式**：支持统一认证或单独配置各环境认证信息
- 💾 **配置持久化**：自动保存用户配置，下次启动时自动加载
- 📋 **历史记录**：记住最近使用的上传配置，提高工作效率
- 🖥️ **命令行支持**：提供命令行测试模式，方便集成到自动化流程

### 用户体验
- 🎨 **现代化界面**：基于Tailwind CSS构建的优雅UI
- ⚡ **响应式设计**：适配不同屏幕尺寸
- 📊 **实时反馈**：上传进度可视化展示
- 🔄 **自动重试**：网络异常时的自动重试机制

## 技术栈

- **前端框架**：Electron + HTML/CSS/JavaScript
- **样式框架**：Tailwind CSS + Font Awesome
- **核心功能**：Node.js + node-ssh + archiver
- **打包工具**：electron-builder（推荐）、electron-packager

## 安装和使用

### 前提条件
- 安装Node.js 16.x或更高版本
- 安装npm或cnpm包管理器

### 本地开发

1. **克隆项目**
```bash
# 克隆项目到本地
git clone <项目地址>
cd auto-uploader
```

2. **安装依赖**
```bash
# 使用npm
npm install

# 或使用cnpm（推荐国内用户）
cnpm install
```

3. **启动开发模式**
```bash
npm start
```

## 打包为桌面应用

### 推荐使用electron-builder进行打包（支持生成安装包）

#### macOS打包
```bash
# 生成DMG安装包（适用于macOS系统）
npm run dist:mac

# 或仅打包应用程序（不生成安装包）
npm run package:mac
```

#### Windows打包
```bash
# 生成NSIS安装包（适用于Windows系统）
npm run dist:win

# 或仅打包应用程序（不生成安装包）
npm run package:win
```

### 使用缓存加速打包（macOS）
项目提供了本地缓存Electron二进制文件的脚本，可加速打包过程：

```bash
# 使用本地缓存的Electron二进制文件进行打包
./build_with_cache.sh
```

## 部署指南

### macOS部署
1. 完成打包后，在`dist`目录下找到`.dmg`文件
2. 双击`.dmg`文件打开安装镜像
3. 将应用程序拖拽到`Applications`文件夹中完成安装
4. 从Launchpad或Applications文件夹启动应用

### Windows部署
1. 完成打包后，在`dist`目录下找到`.exe`安装程序
2. 双击安装程序，按照向导完成安装
3. 从开始菜单或桌面快捷方式启动应用

## 配置管理

应用启动后，您可以：
1. 在设置界面配置各环境的服务器信息（IP、用户名、密码）
2. 选择统一认证模式或独立认证模式
3. 配置完成后，所有设置会自动保存

## 注意事项

### 图标相关
- **重要**：electron-builder不支持SVG格式图标，请确保使用PNG或ICO格式图标
- macOS推荐使用PNG格式图标（1024x1024像素以上）
- Windows推荐使用ICO格式图标

### 依赖管理
- 项目主要依赖：`archiver`（用于文件压缩）和`node-ssh`（用于SSH上传）
- 开发依赖：`electron`、`electron-builder`和`electron-packager`
- 如需安装依赖，建议使用cnpm以提高国内下载速度

### 打包优化
- 应用打包后大小约为380MB左右，这是由于Electron需要包含完整的Chromium浏览器和Node.js运行时
- 如需进一步减小体积，可以在package.json的build配置中添加`"stripDebug": true`以移除调试信息

### 交叉编译说明
- 可以在macOS上尝试交叉编译Windows应用，但可能需要安装wine依赖
- 对于复杂应用或需要代码签名的场景，建议在目标平台上进行打包

## 常见问题

### 应用体积较大
这是Electron应用的正常现象，因为它包含了完整的浏览器和JavaScript运行时。对于功能完整的Electron应用，300-400MB的大小是常见的。

### 打包失败
- 确保使用了正确格式的图标文件（非SVG格式）
- 检查网络连接，特别是首次打包时需要下载Electron二进制文件
- 尝试使用提供的`build_with_cache.sh`脚本利用本地缓存

### 上传失败
- 检查服务器IP、用户名和密码是否正确
- 确保远程路径存在且具有写入权限
- 检查网络连接是否稳定

## 许可证
- Apache-2.0
