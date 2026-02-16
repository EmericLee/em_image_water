
import 'dart:typed_data';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

Future<String?> saveImage(Uint8List bytes, String filename) async {
  final blob = web.Blob([bytes.toJS].toJS);
  final url = web.URL.createObjectURL(blob);
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
  anchor.href = url;
  anchor.download = filename;
  anchor.click();
  web.URL.revokeObjectURL(url);
  return filename;
}
