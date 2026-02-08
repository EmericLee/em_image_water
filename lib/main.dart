import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'pages/watermark_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Water',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _pickAndOpen(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result == null || result.files.isEmpty) return;
    final Uint8List? bytes = result.files.first.bytes;
    final String? path = result.files.first.path;
    if (bytes == null) return;
    if (!context.mounted) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => WatermarkPage(initialImage: bytes, initialPath: path)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImageWater')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Text('ImageWater', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('为图片添加可配置水印 — 支持单行/多行、颜色、倾斜与导出。'),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () => _pickAndOpen(context),
              icon: const Icon(Icons.photo_library),
              label: const Text('选择图片'),
            ),
          ],
        ),
      ),
    );
  }
}
