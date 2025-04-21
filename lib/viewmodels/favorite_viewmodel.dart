// lib/viewmodels/favorite_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/comic.dart';
import '../services/database_helper.dart';

class FavoriteViewModel with ChangeNotifier {
  List<Comic> _favoriteComics = [];

  List<Comic> get favoriteComics => _favoriteComics;

  FavoriteViewModel() {
    fetchFavoriteComics();
  }

  Future<void> fetchFavoriteComics() async {
    _favoriteComics = await DatabaseHelper.instance.getFavoriteComics();
    notifyListeners();
  }

  Future<void> toggleFavorite(Comic comic) async {
    await DatabaseHelper.instance.toggleFavorite(comic.id, !comic.isFavorite);
    await fetchFavoriteComics();
  }
}