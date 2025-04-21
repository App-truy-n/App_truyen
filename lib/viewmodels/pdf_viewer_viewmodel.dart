// lib/viewmodels/pdf_viewer_viewmodel.dart
import 'package:flutter/foundation.dart';

class PDFViewerViewModel with ChangeNotifier {
  String? _chapterPath;
  String? _chapterTitle;

  String? get chapterPath => _chapterPath;
  String? get chapterTitle => _chapterTitle;

  void loadChapter(String path, String title) {
    _chapterPath = path;
    _chapterTitle = title;
    notifyListeners();
  }
}
