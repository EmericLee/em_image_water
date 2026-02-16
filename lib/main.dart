import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'pages/watermark_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uint8List? _blankImage;

  @override
  void initState() {
    super.initState();
    _createBlankImage();
  }

  Future<void> _createBlankImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = Colors.white;
    canvas.drawRect(const Rect.fromLTWH(0, 0, 800, 600), paint);
    final picture = recorder.endRecording();
    final image = picture.toImageSync(800, 600);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (mounted) {
      setState(() {
        _blankImage = byteData!.buffer.asUint8List();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Water',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: _blankImage == null
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : WatermarkPage(initialImage: _blankImage!, initialPath: null),
    );
  }
}
