import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/comic_list_viewmodel.dart';
import '../viewmodels/favorite_viewmodel.dart';
import '../widgets/comic_tile.dart';
import 'comic_detail_screen.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ComicListViewModel, FavoriteViewModel>(
      builder: (context, comicListViewModel, favoriteViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
              ),
            ),
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
          ),
          // Đảm bảo body chiếm toàn màn hình
          body: Container(
            width: double.infinity, // Chiếm toàn bộ chiều rộng
            height: double.infinity, // Chiếm toàn bộ chiều cao
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loli.jpg'), // Ảnh từ thư mục assets
                fit: BoxFit.cover, // Phủ kín toàn bộ màn hình
                alignment: Alignment.center, // Căn giữa ảnh nếu cần
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Lớp phủ để nội dung dễ đọc
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search Comics',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        filled: true, // Đảm bảo TextField có nền
                        fillColor: Colors.white.withOpacity(0.9),
                      ),
                      onChanged: (value) => comicListViewModel.searchComics(value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Favorite Comics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                      ),
                    ),
                  ),
                  favoriteViewModel.favoriteComics.isEmpty
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'No Favorite Comics Yet',
                      style: TextStyle(
                        color: Colors.black12,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                      ),
                    ),
                  )
                      : Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: favoriteViewModel.favoriteComics.length,
                      itemBuilder: (context, index) {
                        final comic = favoriteViewModel.favoriteComics[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComicDetailScreen(comic: comic),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.file(
                                  File(comic.thumbnailPath),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  comic.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    shadows: [
                                      Shadow(color: Colors.black, blurRadius: 2)
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'All Comics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    itemCount: comicListViewModel.comics.length,
                    itemBuilder: (context, index) {
                      final comic = comicListViewModel.comics[index];
                      return ComicTile(
                        comic: comic,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ComicDetailScreen(comic: comic),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}