# EmImageWater - 开源跨平台图像水印工具

## 一句话介绍

**EmImageWater** 是一款基于 Flutter 开发的开源图像水印工具，支持 Windows、macOS、Linux、Android、iOS、Web 六大平台，特别适合国产 UOS 系统（ARM64 架构）。

---

## 为什么开发这个工具？

在日常工作中，经常需要给图片添加水印：
- 设计师保护作品版权
- 运营人员批量处理商品图
- 开发者截图标注

市面上的水印工具要么收费，要么平台受限，要么不支持国产系统。于是我们用 Flutter 开发了这款**完全免费、跨平台、支持国产 UOS** 的水印工具。

---

## 核心亮点

### 🐉 国产 UOS 系统深度适配

- 专门针对**统信 UOS**（ARM64 架构）优化
- 在 Debian 10 容器中构建，确保 GLIBC 2.28 兼容性
- 生成 AppImage 格式，一键安装运行
- 已在国内 ARM 设备上完成测试验证

### 🔄 GitHub Actions 自动化构建

- 完整的 CI/CD 流程，**6 个平台同时自动构建**
- 推送 Tag 后自动发布 Release
- 支持 x64 和 ARM64 双架构

### 📦 集成版本管理

内置发布脚本，一行命令完成版本升级：
```bash
dart run release.dart patch  # 修订版本 +1
dart run release.dart minor  # 次版本 +1
dart run release.dart major  # 主版本 +1
```

### ✨ 功能特性

| 功能 | 说明 |
|------|------|
| 🎨 实时预览 | 所见即所得，调整即时生效 |
| 📝 多模式水印 | 单行定位 / 多行平铺 |
| 🎨 颜色自定义 | 支持透明度调节 |
| 📐 倾斜角度 | 水平 / 左倾斜 / 右倾斜 |
| 💾 配置持久化 | 自动保存，下次恢复 |

---

## 技术栈

- **Flutter 3.38.9** - 跨平台 UI 框架
- **Dart 3.10.8** - 编程语言
- **CustomPainter** - 自定义绘制水印
- **GitHub Actions** - 自动化 CI/CD

---

## 下载使用

### 预编译版本

从 [GitHub Releases](https://github.com/dismind/EmImageWater/releases) 下载：

- Windows: `.exe` / `.zip`
- macOS: `.dmg`
- Linux: `.AppImage`
- Android: `.apk`
- UOS (ARM64): `.AppImage`
- Web: 在线使用

### 从源码运行

```bash
# 克隆仓库
git clone https://github.com/dismind/EmImageWater.git
cd EmImageWater

# 安装依赖
flutter pub get

# 运行
flutter run
```

---

## 项目地址

🔗 **GitHub**: https://github.com/dismind/EmImageWater

📄 **开源协议**: MIT License（可自由商用）

---

## 适合谁用？

- ✅ 需要在 UOS 系统上处理图片的用户
- ✅ 追求跨平台一致体验的开发者
- ✅ 需要批量添加水印的设计师/运营
- ✅ 学习 Flutter 跨平台开发的初学者

---

## 参与贡献

欢迎 Star ⭐ 和 Fork！

如果有问题或建议，欢迎在 GitHub Issues 中提出。

---

**#Flutter #跨平台开发 #UOS #国产系统 #开源工具 #图像处理**
