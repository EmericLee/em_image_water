# EmImageWater

<p align="center">
  <img src="web/icons/Icon-512.png" width="120" alt="EmImageWater Logo">
</p>

<p align="center">
  <strong>Cross-Platform Image Watermark Tool</strong>
</p>



<p align="center">
  <a href="#features">Features</a> •
  <a href="#usage">Usage</a> •
  <a href="#download">Download</a> •
  <a href="#development">Development</a> •
  <a href="#license">License</a>
</p>

<p align="center">
  <a href="README.md">🇨🇳 中文</a> | <strong>🇺🇸 English</srong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/UOS-ARM64-blue?style=flat-square&logo=linux" alt="UOS ARM64">
  <img src="https://img.shields.io/badge/GitHub%20Actions-CI-green?style=flat-square&logo=githubactions" alt="GitHub Actions CI">
  <img src="https://img.shields.io/badge/Version%20Management-Integrated-orange?style=flat-square&logo=dart" alt="Version Management">
  <img src="https://img.shields.io/badge/Flutter-3.38.9-blue?style=flat-square&logo=flutter" alt="Flutter">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square" alt="License">
</p>

---

## 0. Project Overview

**EmImageWater** is a cross-platform image watermark tool built with Flutter, supporting customizable text watermarks for images. Whether processing single images or batch operations, it handles them with ease.

**Fully local processing, private and secure, cross-platform support, safe to use!**

### Key Features

| Feature | Description |
|---------|-------------|
| 📱 **Cross-Platform** | windows/linux/android/ios/uos platforms |
| 🐉 **UOS Support** | Specifically optimized for UnionTech UOS, supports ARM64 architecture |
| 🔄 **GitHub Actions CI** | Complete automated build process, supports 6 platforms with automatic packaging and release |
| 📦 **Integrated Version Management** | Built-in release script, supports one-click version upgrade and automatic tagging |
| 🎨 **Real-time Preview** | All changes displayed in real-time, WYSIWYG |
| 📝 **Multi-Mode Watermark** | Supports both single-line positioning and multi-line tiling modes |
| 🎨 **Color Customization** | Supports any color and transparency adjustment |
| 📐 **Tilt Angle** | Multi-line mode supports horizontal, left tilt, and right tilt |
| 💾 **Persistent Configuration** | Automatically saves user settings, restored on next launch |
| 🖼️ **Multi-Format Support** | Supports PNG, JPEG, WebP, and other common image formats |
| 🚀 **High Performance** | Hardware-accelerated rendering based on Flutter |

### Copyright Information

- **Authors**: dismind, emmind
- **Copyright**: © 2025 EmImageWater Team
- **License**: MIT License
- **GitHub**: [https://github.com/dismind/EmImageWater](https://github.com/dismind/EmImageWater)
- **Contact Email**: lmingrui220@gmail.com

---

## 1. Usage

### 1.1 Quick Start

#### Option 1: Download Pre-built Binaries

Download the appropriate version for your platform from the [Releases](https://github.com/dismind/EmImageWater/releases) page:

| Platform | Download Format |
|----------|-----------------|
| Windows | `.exe` (Installer) / `.zip` (Portable) |
| macOS | `.dmg` |
| Linux | `.AppImage` / `.deb` |
| Android | `.apk` |
| Web | Online Usage |

#### Option 2: Run from Source

1. **Install Flutter Development Environment**
   ```bash
   # Refer to official documentation: https://docs.flutter.dev/get-started/install
   flutter doctor
   ```

2. **Clone Repository**
   ```bash
   git clone https://github.com/dismind/EmImageWater.git
   cd EmImageWater
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Run Application**
   ```bash
   # Development mode
   flutter run

   # Or build release version
   flutter build <platform>
   ```

### 1.2 Feature Usage

#### Adding Watermarks

1. **Select Image**: Click the "Select Image" button to choose an image from local storage
2. **Configure Watermark**:
   - **Text Content**: Enter watermark text (supports multi-line)
   - **Color**: Click the color square to select watermark color (supports transparency)
   - **Size**: Drag the slider to adjust font size
   - **Mode**: Choose "Single Line" or "Multi-line" mode
   - **Position**: In single-line mode, select watermark position (Top-Left, Top-Right, Center, Bottom-Left, Bottom-Right)
   - **Tilt**: In multi-line mode, select tilt angle (Horizontal, Left Tilt, Right Tilt)
3. **Real-time Preview**: All changes are displayed in real-time in the preview area
4. **Save Image**: Click the "Save Image" button to export the processed image

#### Persistent Configuration

- Watermark settings are automatically saved and restored on next application launch
- Supports exporting in different formats (PNG, JPEG, etc.)

---

## 2. Supported Platforms

### 2.1 Platform Support

| Platform | Status | Description |
|----------|--------|-------------|
| **Windows** | ✅ Fully Supported | x64 architecture, Windows 10/11 |
| **macOS** | ✅ Fully Supported | Intel & Apple Silicon |
| **Linux** | ✅ Fully Supported | x64 & ARM64, supports AppImage |
| **Android** | ✅ Fully Supported | Android 5.0+ |
| **iOS** | ✅ Fully Supported | iOS 12.0+ |
| **Web** | ✅ Fully Supported | Modern browsers, supports PWA |

### 2.2 System Requirements

| Platform | Minimum Requirements |
|----------|---------------------|
| Windows | Windows 10, 64-bit |
| macOS | macOS 10.14 (Mojave) |
| Linux | GLIBC 2.28+ (Ubuntu 18.04+) |
| Android | Android 5.0 (API 21) |
| iOS | iOS 12.0 |
| Web | Chrome 80+, Firefox 75+, Safari 13+ |

---

## 3. Technical Architecture

### 3.1 Technology Stack

| Layer | Technology | Description |
|-------|-----------|-------------|
| **Framework** | Flutter 3.38.9 | Cross-platform UI framework |
| **Language** | Dart 3.10.8 | Programming language |
| **State Management** | StatefulWidget | Local state management |
| **Storage** | SharedPreferences | Local configuration storage |
| **Image Processing** | CustomPainter | Custom watermark rendering |

### 3.2 Core Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8      # iOS style icons
  file_picker: ^8.0.0          # File picker
  file_selector: ^0.9.0        # File selector (desktop)
  image: ^4.0.17               # Image processing
  flutter_colorpicker: ^1.0.4  # Color picker
  path_provider: ^2.0.14       # Path provider
  shared_preferences: ^2.1.2   # Configuration storage
  path: ^1.8.3                 # Path utilities
```

### 3.3 Project Structure

```
EmImageWater/
├── lib/                      # Dart source code
│   ├── main.dart            # Application entry
│   ├── pages/               # Pages
│   │   └── watermark_page.dart    # Watermark editing page
│   └── utils/               # Utility functions
│       ├── save_image.dart        # Image saving (platform adapter)
│       ├── save_image_io.dart     # IO implementation
│       └── save_image_web.dart    # Web implementation
├── android/                 # Android platform code
├── ios/                     # iOS platform code
├── windows/                 # Windows platform code
├── macos/                   # macOS platform code
├── linux/                   # Linux platform code
├── web/                     # Web platform code
├── .github/workflows/       # CI/CD configuration
│   └── build_auto.yml       # Automated build workflow
├── pubspec.yaml             # Project configuration
└── README.md                # Project documentation
```

### 3.4 Architecture Highlights

1. **🐉 Deep UOS System Adaptation**
   - Specifically optimized for UnionTech UOS system (ARM64 architecture)
   - Uses Debian 10 container for building, ensuring GLIBC 2.28 compatibility
   - Generates AppImage format, supports one-click installation and execution
   - Tested and verified on domestic ARM devices

2. **🔄 GitHub Actions Automated CI/CD**
   - Complete automated build process, supports 6 platforms simultaneously
   - Automatic packaging: Windows (exe/zip), Linux (AppImage), Android (apk), UOS (AppImage ARM64)
   - Automatic release: Creates Release and uploads build artifacts after pushing Tag
   - Multi-architecture support: Parallel building for x64 and ARM64 architectures

3. **📦 Integrated Version Management System**
   - Built-in `release.dart` release script, supports semantic version management
   - One-click version upgrade: `dart run release.dart patch/minor/major/build`
   - Automatically creates Git Tag and commit messages
   - Automatically pushes code and tags to remote repository

4. **Cross-Platform Design**
   - Uses conditional imports for platform-specific code
   - `save_image.dart` automatically selects IO or Web implementation via `export`

5. **Responsive Layout**
   - Supports desktop widescreen layout and mobile portrait layout
   - Adaptive preview area and control panel

6. **Performance Optimization**
   - Uses `RepaintBoundary` to optimize rendering performance
   - Image processing uses `CustomPainter` hardware acceleration

7. **Persistent Configuration**
   - Uses `SharedPreferences` to save user settings
   - JSON serialization of configuration data

---

## 4. Development Guide

### 4.1 Environment Setup

#### Required Tools

| Tool | Version | Description |
|------|---------|-------------|
| Flutter SDK | 3.38.9+ | Cross-platform development framework |
| Dart SDK | 3.10.8+ | Programming language |
| Git | 2.30+ | Version control |
| IDE | VS Code / Android Studio | VS Code recommended |

#### Recommended VS Code Extensions

- **Flutter** - Official Flutter extension
- **Dart** - Dart language support
- **Flutter Tree** - Widget tree visualization
- **Better Comments** - Comment highlighting

### 4.2 Development Workflow

#### 1. Clone Repository

```bash
git clone https://github.com/dismind/EmImageWater.git
cd EmImageWater
```

#### 2. Install Dependencies

```bash
flutter pub get
```

#### 3. Run and Debug

```bash
# Hot reload development mode
flutter run

# Specify platform
flutter run -d windows
flutter run -d chrome
flutter run -d android
```

#### 4. Code Standards

```bash
# Format code
flutter format .

# Static analysis
flutter analyze

# Run tests
flutter test
```

### 4.3 Project Extension Guide

#### Adding New Watermark Effects

1. Modify the `WatermarkPainter` class in `watermark_page.dart`
2. Implement custom drawing logic
3. Add control options in the configuration panel

#### Adding New Image Format Support

1. Update `file_picker`'s `allowedExtensions`
2. Add format validation in `WatermarkPage`

#### Adding Platform-Specific Features

1. Create platform interface in `utils/`
2. Implement `xxx_io.dart` (mobile/desktop)
3. Implement `xxx_web.dart` (Web)
4. Use conditional export

```dart
// utils/new_feature.dart
export 'new_feature_io.dart' 
    if (dart.library.html) 'new_feature_web.dart';
```

### 4.4 Build and Release

#### Local Build

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

#### Using Release Script

```bash
# Upgrade version and release
dart run release.dart patch   # Patch version +1
dart run release.dart minor   # Minor version +1
dart run release.dart major   # Major version +1
dart run release.dart build   # Build number +1
```

### 4.5 Contribution Guidelines

1. **Fork the repository**
2. **Create branch**: `git checkout -b feature/your-feature`
3. **Commit changes**: `git commit -m "feat: add new feature"`
4. **Push branch**: `git push origin feature/your-feature`
5. **Create Pull Request**

#### Commit Message Convention

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation update
- `style:` Code formatting
- `refactor:` Refactoring
- `test:` Test related
- `chore:` Build/tools

### 4.6 FAQ

#### Q: Build fails,提示找不到 Flutter SDK?

A: Ensure Flutter SDK is properly installed and added to PATH:
```bash
flutter doctor
```

#### Q: Image doesn't display after selection?

A: Check if `file_picker` version is compatible with current Flutter version.

#### Q: How to debug specific platform?

A: Use `-d` parameter to specify device:
```bash
flutter devices          # List available devices
flutter run -d windows   # Run Windows version
```

---

## License

This project is licensed under the [MIT License](LICENSE).

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

---

<p align="center">
  <a href="README.md">🇨🇳 中文</a> | <strong>🇺🇸 English</strong>
</p>
