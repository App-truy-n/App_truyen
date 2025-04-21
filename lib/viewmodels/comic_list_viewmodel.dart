// lib/viewmodels/comic_list_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/comic.dart';
import '../services/database_helper.dart';

class ComicListViewModel with ChangeNotifier {
  List<Comic> _comics = [];
  List<Comic> _filteredComics = [];

  List<Comic> get comics => _filteredComics;

  ComicListViewModel() {
    fetchComics();
  }

  Future<void> fetchComics() async {
    _comics = await DatabaseHelper.instance.getComics();
    _filteredComics = _comics;
    notifyListeners();
  }

  void searchComics(String query) {
    if (query.isEmpty) {
      _filteredComics = _comics;
    } else {
      _filteredComics = _comics.where((comic) => comic.title.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(Comic comic) async {
    await DatabaseHelper.instance.toggleFavorite(comic.id, !comic.isFavorite);
    fetchComics(); // Load lại danh sách truyện có trạng thái mới
  }

}