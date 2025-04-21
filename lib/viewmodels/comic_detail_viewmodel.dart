// lib/viewmodels/comic_detail_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/chapter.dart';
import '../services/database_helper.dart';

class ComicDetailViewModel with ChangeNotifier {
  List<Chapter> _chapters = [];
  bool _isLoading = false;

  List<Chapter> get chapters => _chapters;
  bool get isLoading => _isLoading;

  Future<void> fetchChapters(int comicId) async {
    _isLoading = true;
    notifyListeners();

    _chapters = await DatabaseHelper.instance.getChapters(comicId);
    _isLoading = false;
    notifyListeners();
  }
}