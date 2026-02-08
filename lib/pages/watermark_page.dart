import 'dart:typed_data';
import 'dart:io' show File, Platform;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path/path.dart' as p;
import '../utils/save_image.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WatermarkPage extends StatefulWidget {
  final Uint8List initialImage;
  final String? initialPath;
  const WatermarkPage({super.key, required this.initialImage, this.initialPath});

  @override
  State<WatermarkPage> createState() => _WatermarkPageState();
}

class _WatermarkPageState extends State<WatermarkPage> {
  Uint8List? _originalBytes;
  String? _originalPath;
  final TextEditingController _textController = TextEditingController(text: 'EmeImageWater');
  Color _color = const Color.fromRGBO(128, 128, 128, 0.4);
  double _fontSize = 24;
  // Preview layout
  double? _previewWidth;

  // Watermark configuration
  WatermarkMode _mode = WatermarkMode.single;
  WatermarkPosition _position = WatermarkPosition.bottomRight;
  WatermarkOrientation _orientation = WatermarkOrientation.horizontal;
  final double _lineSpacing = 2.7;
  final GlobalKey _previewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _originalBytes = widget.initialImage;
    _originalPath = widget.initialPath;
    _loadConfig();
  }

  // image selection is handled by the home page; no internal picker here

  void _pickColor() async {
    Color temp = _color;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('选择水印颜色'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: temp,
            onColorChanged: (c) => temp = c,
            enableAlpha: true,
            labelTypes: const [],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('取消')),
          TextButton(
              onPressed: () {
                setState(() { _color = temp; _saveConfig(); });
                Navigator.of(context).pop();
              },
              child: const Text('确定')),
        ],
      ),
    );
  }

  // No explicit apply: preview updates live in the widget tree.

  Future<void> _loadConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonStr = prefs.getString('watermark_config');
      if (jsonStr == null) return;
      final Map<String, dynamic> map = jsonDecode(jsonStr);
      setState(() {
        _textController.text = map['text'] as String? ?? _textController.text;
        final colorVal = map['color'] as int?;
        if (colorVal != null) _color = Color(colorVal);
        _fontSize = (map['fontSize'] as num?)?.toDouble() ?? _fontSize;
        _mode = (map['mode'] as String?) == 'multi' ? WatermarkMode.multi : WatermarkMode.single;
        final pos = map['position'] as String?;
        if (pos != null) {
          switch (pos) {
            case 'topLeft':
              _position = WatermarkPosition.topLeft;
              break;
            case 'topRight':
              _position = WatermarkPosition.topRight;
              break;
            case 'bottomLeft':
              _position = WatermarkPosition.bottomLeft;
              break;
            case 'bottomRight':
              _position = WatermarkPosition.bottomRight;
              break;
            case 'center':
              _position = WatermarkPosition.center;
              break;
          }
        }
        final orient = map['orientation'] as String?;
        if (orient != null) {
          switch (orient) {
            case 'leftLean':
              _orientation = WatermarkOrientation.leftLean;
              break;
            case 'rightLean':
              _orientation = WatermarkOrientation.rightLean;
              break;
            default:
              _orientation = WatermarkOrientation.horizontal;
          }
        }
      });
    } catch (_) {}
  }

  Future<void> _saveConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final map = <String, dynamic>{
        'text': _textController.text,
        'color': _color.value,
        'fontSize': _fontSize,
        'mode': _mode == WatermarkMode.multi ? 'multi' : 'single',
        'position': _position.name,
        'orientation': _orientation.name,
      };
      await prefs.setString('watermark_config', jsonEncode(map));
    } catch (_) {}
  }

  Future<void> _saveResult() async {
    if (_originalBytes == null) return;
    final boundary = _previewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return;
    try {
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
      final ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw Exception('capture failed');
      final bytes = byteData.buffer.asUint8List();
      // On Windows, prompt for save location and default to the original image's folder
      if (!kIsWeb && Platform.isWindows) {
        final origDir = _originalPath != null ? p.dirname(_originalPath!) : null;
        final origBase = _originalPath != null ? p.basename(_originalPath!) : 'image.png';
        final prefix = _sanitizeFilename(_textController.text.isNotEmpty ? _textController.text : 'watermarked');
        final suggested = '${prefix}_$origBase';
        final savePath = await getSavePath(suggestedName: suggested, initialDirectory: origDir);
        if (savePath == null) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已取消保存')));
        } else {
          final f = File(savePath);
          await f.writeAsBytes(bytes);
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('已保存: $savePath')));
        }
      } else {
        final name = 'watermarked_${DateTime.now().millisecondsSinceEpoch}.png';
        final savedPath = await saveImage(bytes, name);
        final msg = savedPath == null ? '保存失败' : '已保存: $savedPath';
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('保存失败')));
    }
  }

  Future<void> _reselectImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result == null || result.files.isEmpty) return;
    final bytes = result.files.first.bytes;
    final path = result.files.first.path;
    if (bytes == null) return;
    if (!mounted) return;
    setState(() {
      _originalBytes = bytes;
      _originalPath = path ?? _originalPath;
    });
  }

  String _sanitizeFilename(String s) {
    var name = s.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
    name = name.replaceAll(RegExp(r'\s+'), '_');
    if (name.isEmpty) name = 'watermarked';
    return name;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('添加水印')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            if (_originalBytes != null)
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  // Decide horizontal layout for wide windows to reduce vertical scrolling
                  final wide = constraints.maxWidth > 800;

                  Widget previewWidget = LayoutBuilder(builder: (context, pConstraints) {
                    final w = pConstraints.maxWidth;
                    if (_previewWidth != w) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() => _previewWidth = w);
                      });
                    }
                    return RepaintBoundary(
                      key: _previewKey,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.memory(_originalBytes!),
                          if ((_textController.text).isNotEmpty)
                            Positioned.fill(
                              child: CustomPaint(
                                painter: WatermarkPainter(
                                  text: _textController.text,
                                  color: _color,
                                  mode: _mode,
                                  position: _position,
                                  orientation: _orientation,
                                  lineSpacing: _lineSpacing,
                                  targetWidthRatio: 0.3,
                                  explicitFontSize: _fontSize,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  });

                  Widget controls = Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      TextField(
                        controller: _textController,
                        decoration: const InputDecoration(labelText: '水印文字'),
                        maxLines: _mode == WatermarkMode.multi ? null : 1,
                        onChanged: (_) => setState(() { _saveConfig(); }),
                      ),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Text('模式：'),
                        const SizedBox(width: 8),
                        DropdownButton<WatermarkMode>(
                          value: _mode,
                          items: WatermarkMode.values
                              .map((m) => DropdownMenuItem(value: m, child: Text(m.label)))
                              .toList(),
                          onChanged: (v) => setState(() { _mode = v ?? _mode; _saveConfig(); }),
                        ),
                        const SizedBox(width: 12),
                        if (_mode == WatermarkMode.single) ...[
                          const Text('位置：'),
                          const SizedBox(width: 8),
                          DropdownButton<WatermarkPosition>(
                            value: _position,
                            items: WatermarkPosition.values
                                .map((p) => DropdownMenuItem(value: p, child: Text(p.label)))
                                .toList(),
                            onChanged: (v) => setState(() { _position = v ?? _position; _saveConfig(); }),
                          ),
                        ] else ...[
                          const Text('倾斜：'),
                          const SizedBox(width: 8),
                          DropdownButton<WatermarkOrientation>(
                            value: _orientation,
                            items: WatermarkOrientation.values
                                .map((o) => DropdownMenuItem(value: o, child: Text(o.label)))
                                .toList(),
                            onChanged: (v) => setState(() { _orientation = v ?? _orientation; _saveConfig(); }),
                          ),
                        ],
                      ]),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Text('颜色：'),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _pickColor,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(color: _color, border: Border.all()),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('大小：'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Slider(
                            min: 6,
                            max: 128,
                            value: _fontSize,
                            onChanged: (v) => setState(() { _fontSize = v; _saveConfig(); }),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 12),
                      Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _reselectImage,
                            child: const Text('重新选择图片'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _saveResult,
                            icon: const Icon(Icons.save),
                            label: const Text('保存图片'),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 12),
                      const Text('预览：', style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                  );

                  if (wide) {
                    return Row(children: [
                      Expanded(child: Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.65), child: previewWidget))),
                      SizedBox(width: 12),
                      SizedBox(width: 360, child: SingleChildScrollView(child: controls)),
                    ]);
                  }

                  // Narrow screens: stacked layout
                  return SingleChildScrollView(
                    child: Column(children: [
                      ConstrainedBox(constraints: BoxConstraints(maxWidth: constraints.maxWidth), child: previewWidget),
                      const SizedBox(height: 8),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: controls),
                    ]),
                  );
                }),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  // alignment and angle helpers removed (moved to painter)
}

enum WatermarkMode { single, multi }

extension on WatermarkMode {
  String get label => this == WatermarkMode.single ? '单行' : '多行';
}

enum WatermarkPosition { topLeft, topRight, bottomLeft, bottomRight, center }

extension on WatermarkPosition {
  String get label {
    switch (this) {
      case WatermarkPosition.topLeft:
        return '左上';
      case WatermarkPosition.topRight:
        return '右上';
      case WatermarkPosition.bottomLeft:
        return '左下';
      case WatermarkPosition.bottomRight:
        return '右下';
      case WatermarkPosition.center:
        return '居中';
    }
  }
}

enum WatermarkOrientation { horizontal, leftLean, rightLean }

extension on WatermarkOrientation {
  String get label {
    switch (this) {
      case WatermarkOrientation.horizontal:
        return '水平';
      case WatermarkOrientation.leftLean:
        return '左倾斜';
      case WatermarkOrientation.rightLean:
        return '右倾斜';
    }
  }
}

class WatermarkPainter extends CustomPainter {
  final String text;
  final Color color;
  final WatermarkMode mode;
  final WatermarkPosition position;
  final WatermarkOrientation orientation;
  final double lineSpacing;
  final double targetWidthRatio;
  final double? explicitFontSize;

  WatermarkPainter({
    required this.text,
    required this.color,
    required this.mode,
    required this.position,
    required this.orientation,
    required this.lineSpacing,
    required this.targetWidthRatio,
    this.explicitFontSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (text.isEmpty) return;
    canvas.clipRect(Offset.zero & size);
    final targetWidth = size.width * targetWidthRatio;
    final fontSize = explicitFontSize != null && explicitFontSize! > 0 ? explicitFontSize! : _computeFontSize(text, targetWidth);

    TextPainter tp(String s) {
      final t = TextPainter(text: TextSpan(text: s, style: TextStyle(color: color, fontSize: fontSize)), textDirection: TextDirection.ltr);
      t.layout();
      return t;
    }

    if (mode == WatermarkMode.single) {
      final painter = tp(text);
      final dx = _dxForPosition(painter.width, size.width, position);
      final dy = _dyForPosition(painter.height, size.height, position);
      canvas.save();
      // single-line always horizontal regardless of orientation setting
      final angle = 0.0;
      canvas.translate(dx + painter.width / 2, dy + painter.height / 2);
      canvas.rotate(angle);
      painter.paint(canvas, Offset(-painter.width / 2, -painter.height / 2));
      canvas.restore();
    } else {
      // tiled multi-line
      final single = tp(text);
      final gap = fontSize * 0.2;
      final stepX = single.width + gap;
      final lineHeight = fontSize * lineSpacing;
      final angle = _angleForOrientation(orientation);

      // start a bit negative to allow angled text to begin off-canvas
      for (double y = -lineHeight; y < size.height + lineHeight; y += lineHeight) {
        double xStart = -single.width;
        // optionally offset alternate lines for tessellation
        for (double x = xStart; x < size.width + stepX; x += stepX) {
          canvas.save();
          canvas.translate(x + single.width / 2, y + single.height / 2);
          canvas.rotate(angle);
          single.paint(canvas, Offset(-single.width / 2, -single.height / 2));
          canvas.restore();
        }
      }
    }
  }

  double _computeFontSize(String text, double targetWidth) {
    // binary search for font size so that measured width ~ targetWidth
    double lo = 6, hi = 512;
    for (int i = 0; i < 20; i++) {
      final mid = (lo + hi) / 2;
      final tp = TextPainter(text: TextSpan(text: text, style: TextStyle(fontSize: mid)), textDirection: TextDirection.ltr)..layout();
      if (tp.width > targetWidth) {
        hi = mid;
      } else {
        lo = mid;
      }
    }
    return lo;
  }

  double _dxForPosition(double textWidth, double totalWidth, WatermarkPosition p) {
    switch (p) {
      case WatermarkPosition.topLeft:
      case WatermarkPosition.bottomLeft:
        return 10;
      case WatermarkPosition.topRight:
      case WatermarkPosition.bottomRight:
        return totalWidth - textWidth - 10;
      case WatermarkPosition.center:
        return (totalWidth - textWidth) / 2;
    }
  }

  double _dyForPosition(double textHeight, double totalHeight, WatermarkPosition p) {
    switch (p) {
      case WatermarkPosition.topLeft:
      case WatermarkPosition.topRight:
        return 10;
      case WatermarkPosition.bottomLeft:
      case WatermarkPosition.bottomRight:
        return totalHeight - textHeight - 10;
      case WatermarkPosition.center:
        return (totalHeight - textHeight) / 2;
    }
  }

  double _angleForOrientation(WatermarkOrientation o) {
    switch (o) {
      case WatermarkOrientation.horizontal:
        return 0.0;
      case WatermarkOrientation.leftLean:
        return -0.2;
      case WatermarkOrientation.rightLean:
        return 0.2;
    }
  }

  @override
  bool shouldRepaint(covariant WatermarkPainter old) {
    return old.text != text ||
        old.color != color ||
        old.mode != mode ||
        old.position != position ||
        old.orientation != orientation ||
        old.lineSpacing != lineSpacing ||
        old.targetWidthRatio != targetWidthRatio ||
        old.explicitFontSize != explicitFontSize;
  }
}
