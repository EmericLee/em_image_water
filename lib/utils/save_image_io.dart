import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String?> saveImage(Uint8List bytes, String filename) async {
  try {
    Directory? dir;
    try {
      dir = await getDownloadsDirectory();
    } catch (_) {
      dir = null;
    }
    dir ??= await getApplicationDocumentsDirectory();
    final file = File('${dir.path}${Platform.pathSeparator}$filename');
    await file.writeAsBytes(bytes);
    return file.path;
  } catch (e) {
    return null;
  }
}
