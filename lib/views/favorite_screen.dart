// lib/views/favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/comic.dart';
import '../viewmodels/favorite_viewmodel.dart';
import '../widgets/comic_tile.dart';
import 'comic_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Truyện yêu thích'),
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: false,
          ),
          body: viewModel.favoriteComics.isEmpty
              ? Center(child: Text('Chưa có truyện yêu thích'))
              : ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: viewModel.favoriteComics.length,
            itemBuilder: (context, index) {
              final comic = viewModel.favoriteComics[index];
              return ComicTile(
                comic: comic,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicDetailScreen(comic: comic),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}


