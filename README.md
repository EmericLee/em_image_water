# EmImageWater
 
<p align="center">
  <img src="web/icons/Icon-512.png" width="120" alt="EmImageWater Logo">
</p>

<p align="center">
  <strong>跨平台图像水印工具</strong>
</p>

<p align="center">
  <a href="#特性">特性</a> •
  <a href="#使用说明">使用说明</a> •
  <a href="#下载">下载</a> •
  <a href="#开发">开发</a> •
  <a href="#许可证">许可证</a>
</p>

<p align="center">
  <strong>🇨🇳 中文</strong> | <a href="README_EN.md">🇺🇸 English</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/UOS-ARM64-blue?style=flat-square&logo=linux" alt="UOS ARM64">
  <img src="https://img.shields.io/badge/GitHub%20Actions-CI-green?style=flat-square&logo=githubactions" alt="GitHub Actions CI">
  <img src="https://img.shields.io/badge/版本管理-集成-orange?style=flat-square&logo=dart" alt="版本管理">
  <img src="https://img.shields.io/badge/Flutter-3.38.9-blue?style=flat-square&logo=flutter" alt="Flutter">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square" alt="License">
</p>

---

## 0. 项目简介

**EmImageWater** 是一款基于 Flutter 开发的跨平台图像水印工具，支持为图片添加可自定义的文字水印。无论是单张图片处理还是批量操作，都能轻松应对。

**完全本地处理，私密安全，跨平台支持，安全使用！**

**EmImageWater** is a cross-platform image watermark tool built with Flutter, supporting customizable text watermarks for images. Whether processing single images or batch operations, it handles them with ease. <a href="README_EN.md">English Readme</a>

### 主要特性

| 特性 | 说明 |
|------|------|
| 📱 **跨平台** | 一套代码，windows/linux/android/ios/uos多端运行 |
| 🐉 **UOS 系统支持** | 专门针对统信 UOS 系统进行适配优化，支持 ARM64 架构 |
| 🔄 **GitHub Actions CI** | 完整的自动化构建流程，支持 6 个平台自动打包发布 |
| 📦 **集成版本管理** | 内置发布脚本，支持一键版本升级和自动打 Tag |
| 🎨 **实时预览** | 所有修改实时显示，所见即所得 |
| 📝 **多模式水印** | 支持单行定位和多行平铺两种模式 |
| 🎨 **颜色自定义** | 支持任意颜色和透明度调节 |
| 📐 **倾斜角度** | 多行模式支持水平、左倾斜、右倾斜 |
| 💾 **配置持久化** | 自动保存用户配置，下次启动恢复 |
| 🖼️ **多格式支持** | 支持 PNG、JPEG、WebP 等常见图片格式 |
| 🚀 **高性能** | 基于 Flutter 的硬件加速渲染 |

### 版权信息

- **作者**: dismind, emmind
- **版权所有**: © 2025 EmImageWater Team
- **许可证**: MIT License
- **GitHub**: [https://github.com/dismind/EmImageWater](https://github.com/dismind/EmImageWater)
- **联系邮箱**: lmingrui220@gmail.com

---

## 1. 使用说明

### 1.1 快速开始

#### 方式一：下载预编译版本

从 [Releases](https://github.com/dismind/EmImageWater/releases) 页面下载适合您平台的版本：

| 平台 | 下载格式 |
|------|----------|
| Windows | `.exe` (安装程序) / `.zip` (便携版) |
| macOS | `.dmg` |
| Linux | `.AppImage` / `.deb` |
| Android | `.apk` |
| Web | 在线使用 |

#### 方式二：从源码运行

1. **安装 Flutter 开发环境**
   ```bash
   # 参考官方文档: https://docs.flutter.dev/get-started/install
   flutter doctor
   ```

2. **克隆仓库**
   ```bash
   git clone https://github.com/dismind/EmImageWater.git
   cd EmImageWater
   ```

3. **安装依赖**
   ```bash
   flutter pub get
   ```

4. **运行应用**
   ```bash
   # 开发模式
   flutter run

   # 或构建发布版本
   flutter build <platform>
   ```

### 1.2 功能使用

#### 添加水印

1. **选择图片**: 点击"选择图片"按钮，从本地选择需要添加水印的图片
2. **配置水印**:
   - **文字内容**: 输入水印文字（支持多行）
   - **颜色**: 点击颜色方块选择水印颜色（支持透明度）
   - **大小**: 拖动滑块调整字体大小
   - **模式**: 选择"单行"或"多行"模式
   - **位置**: 单行模式下可选择水印位置（左上、右上、居中、左下、右下）
   - **倾斜**: 多行模式下可选择倾斜角度（水平、左倾斜、右倾斜）
3. **实时预览**: 所有修改实时显示在预览区域
4. **保存图片**: 点击"保存图片"按钮导出处理后的图片

#### 配置持久化

- 水印配置会自动保存，下次打开应用时自动恢复
- 支持导出不同格式（PNG、JPEG等）

---

## 2. 支撑平台

### 2.1 支撑平台

| 平台 | 状态 | 说明 |
|------|------|------|
| **Windows** | ✅ 完全支持 | x64 架构，Windows 10/11 |
| **macOS** | ✅ 完全支持 | Intel & Apple Silicon |
| **Linux** | ✅ 完全支持 | x64 & ARM64，支持 AppImage |
| **Android** | ✅ 完全支持 | Android 5.0+ |
| **iOS** | ✅ 完全支持 | iOS 12.0+ |
| **Web** | ✅ 完全支持 | 现代浏览器，支持 PWA |

### 2.2 系统要求

| 平台 | 最低要求 |
|------|----------|
| Windows | Windows 10, 64位 |
| macOS | macOS 10.14 (Mojave) |
| Linux | GLIBC 2.28+ (Ubuntu 18.04+) |
| Android | Android 5.0 (API 21) |
| iOS | iOS 12.0 |
| Web | Chrome 80+, Firefox 75+, Safari 13+ |

---

## 3. 技术架构及特点

### 3.1 技术栈

| 层级 | 技术 | 说明 |
|------|------|------|
| **框架** | Flutter 3.38.9 | 跨平台 UI 框架 |
| **语言** | Dart 3.10.8 | 编程语言 |
| **状态管理** | StatefulWidget | 本地状态管理 |
| **存储** | SharedPreferences | 本地配置存储 |
| **图片处理** | CustomPainter | 自定义绘制水印 |

### 3.2 核心依赖

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8      # iOS 风格图标
  file_picker: ^8.0.0          # 文件选择
  file_selector: ^0.9.0        # 文件选择（桌面端）
  image: ^4.0.17               # 图片处理
  flutter_colorpicker: ^1.0.4  # 颜色选择器
  path_provider: ^2.0.14       # 路径获取
  shared_preferences: ^2.1.2   # 配置存储
  path: ^1.8.3                 # 路径处理
```

### 3.3 项目结构

```
EmImageWater/
├── lib/                      # Dart 源代码
│   ├── main.dart            # 应用入口
│   ├── pages/               # 页面
│   │   └── watermark_page.dart    # 水印编辑页面
│   └── utils/               # 工具函数
│       ├── save_image.dart        # 图片保存（平台适配）
│       ├── save_image_io.dart     # IO 实现
│       └── save_image_web.dart    # Web 实现
├── android/                 # Android 平台代码
├── ios/                     # iOS 平台代码
├── windows/                 # Windows 平台代码
├── macos/                   # macOS 平台代码
├── linux/                   # Linux 平台代码
├── web/                     # Web 平台代码
├── .github/workflows/       # CI/CD 配置
│   └── build_auto.yml       # 自动构建工作流
├── pubspec.yaml             # 项目配置
└── README.md                # 项目说明
```

### 3.4 架构特点

1. **🐉 UOS 系统深度适配**
   - 针对统信 UOS 系统（ARM64 架构）进行专门优化
   - 使用 Debian 10 容器构建，确保 GLIBC 2.28 兼容性
   - 生成 AppImage 格式，支持一键安装运行
   - 已在国内 ARM 设备上完成测试验证

2. **🔄 GitHub Actions 自动化 CI/CD**
   - 完整的自动化构建流程，支持 6 个平台同时构建
   - 自动打包：Windows (exe/zip)、Linux (AppImage)、Android (apk)、UOS (AppImage ARM64)
   - 自动发布：推送 Tag 后自动创建 Release 并上传构建产物
   - 多架构支持：x64 和 ARM64 架构并行构建

3. **📦 集成版本管理系统**
   - 内置 `release.dart` 发布脚本，支持语义化版本管理
   - 一键升级版本号：`dart run release.dart patch/minor/major/build`
   - 自动创建 Git Tag 和提交信息
   - 自动推送代码和标签到远程仓库

4. **跨平台设计**
   - 使用条件导入实现平台特定代码
   - `save_image.dart` 通过 `export` 自动选择 IO 或 Web 实现

5. **响应式布局**
   - 支持桌面端宽屏布局和移动端竖屏布局
   - 自适应预览区域和控制面板

6. **性能优化**
   - 使用 `RepaintBoundary` 优化渲染性能
   - 图片处理使用 `CustomPainter` 硬件加速

7. **配置持久化**
   - 使用 `SharedPreferences` 保存用户配置
   - JSON 序列化配置数据

---

## 4. 项目二次开发指引

### 4.1 环境准备

#### 必需工具

| 工具 | 版本 | 说明 |
|------|------|------|
| Flutter SDK | 3.38.9+ | 跨平台开发框架 |
| Dart SDK | 3.10.8+ | 编程语言 |
| Git | 2.30+ | 版本控制 |
| IDE | VS Code / Android Studio | 推荐 VS Code |

#### 推荐 VS Code 插件

- **Flutter** - 官方 Flutter 插件
- **Dart** - Dart 语言支持
- **Flutter Tree** - Widget 树可视化
- **Better Comments** - 注释高亮

### 4.2 开发流程

#### 1. 克隆仓库

```bash
git clone https://github.com/dismind/EmImageWater.git
cd EmImageWater
```

#### 2. 安装依赖

```bash
flutter pub get
```

#### 3. 运行调试

```bash
# 热重载开发模式
flutter run

# 指定平台
flutter run -d windows
flutter run -d chrome
flutter run -d android
```

#### 4. 代码规范

```bash
# 格式化代码
flutter format .

# 静态分析
flutter analyze

# 运行测试
flutter test
```

### 4.3 项目扩展指南

#### 添加新的水印效果

1. 在 `watermark_page.dart` 中修改 `WatermarkPainter` 类
2. 实现自定义绘制逻辑
3. 在配置面板添加控制选项

#### 添加新的图片格式支持

1. 更新 `file_picker` 的 `allowedExtensions`
2. 在 `WatermarkPage` 中添加格式验证

#### 添加平台特定功能

1. 在 `utils/` 创建平台接口
2. 实现 `xxx_io.dart`（移动端/桌面端）
3. 实现 `xxx_web.dart`（Web 端）
4. 使用条件导出

```dart
// utils/new_feature.dart
export 'new_feature_io.dart' 
    if (dart.library.html) 'new_feature_web.dart';
```

### 4.4 构建发布

#### 本地构建

```bash
# Windows
flutter build windows --release

# Android
flutter build apk --release
flutter build appbundle --release

# Web
flutter build web --release

# Linux
flutter build linux --release

# macOS
flutter build macos --release
```

#### 使用发布脚本

```bash
# 升级版本号并发布
dart run release.dart patch   # 修订版本 +1
dart run release.dart minor   # 次版本 +1
dart run release.dart major   # 主版本 +1
dart run release.dart build   # 构建号 +1
```

### 4.5 贡献指南

1. **Fork 仓库**
2. **创建分支**: `git checkout -b feature/your-feature`
3. **提交更改**: `git commit -m "feat: add new feature"`
4. **推送分支**: `git push origin feature/your-feature`
5. **创建 Pull Request**

#### 提交信息规范

- `feat:` 新功能
- `fix:` 修复问题
- `docs:` 文档更新
- `style:` 代码格式
- `refactor:` 重构
- `test:` 测试相关
- `chore:` 构建/工具

### 4.6 常见问题

#### Q: 构建失败，提示找不到 Flutter SDK？

A: 确保 Flutter SDK 已正确安装并添加到 PATH：
```bash
flutter doctor
```

#### Q: 图片选择后无法显示？

A: 检查 `file_picker` 版本是否兼容当前 Flutter 版本。

#### Q: 如何调试特定平台？

A: 使用 `-d` 参数指定设备：
```bash
flutter devices          # 列出可用设备
flutter run -d windows   # 运行 Windows 版本
```

---

## 许可证

本项目采用 [MIT License](LICENSE) 开源许可证。

```
MIT License

Copyright (c) 2025 EmImageWater Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/dismind">dismind</a> & <a href="https://github.com/emmind">emmind</a>
</p>
