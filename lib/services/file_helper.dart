// lib/services/file_helper.dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FileHelper {
  static Future<String> getStorageDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<void> initializeDirectories() async {
    final baseDir = await getStorageDirectory();
    await Directory(path.join(baseDir, 'thumbnails')).create(recursive: true);
    await Directory(path.join(baseDir, 'chapters')).create(recursive: true);
  }

  static Future<String> saveFile(Uint8List unit8File, String destinationFolder, String fileName) async {
    final baseDir = await getStorageDirectory();
    //
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/$fileName').create();
    file.writeAsBytesSync(unit8File);
    //
    final destinationPath = path.join(baseDir, destinationFolder, path.basename(file.path));
    await file.copy(destinationPath);
    return destinationPath;
  }
}