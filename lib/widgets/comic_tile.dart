import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/comic.dart';
import '../viewmodels/comic_list_viewmodel.dart';
import '../viewmodels/favorite_viewmodel.dart';

class ComicTile extends StatelessWidget {
  final Comic comic;
  final VoidCallback onTap;

  const ComicTile({required this.comic, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.file(
          File(comic.thumbnailPath),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        ),
        title: Text(
          comic.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(comic.category),
        trailing: Consumer2<ComicListViewModel, FavoriteViewModel>(
          builder: (context, comicListVM, favoriteVM, child) {
            return IconButton(
              icon: Icon(
                comic.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: comic.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () async {
                await comicListVM.toggleFavorite(comic);
                await favoriteVM.fetchFavoriteComics();
              },

            );
          },
        ),
        onTap: onTap,
      ),
    );
  }
}