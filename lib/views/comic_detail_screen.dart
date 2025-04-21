// lib/views/comic_detail_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/comic.dart';
import '../viewmodels/comic_detail_viewmodel.dart';
import 'pdf_viewer_screen.dart';

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailScreen({required this.comic});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ComicDetailViewModel>(context, listen: false);
    viewModel.fetchChapters(comic.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Image.file(
            File(comic.thumbnailPath),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Danh sách chương',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
          ),
          Expanded(
            child: Consumer<ComicDetailViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: viewModel.chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = viewModel.chapters[index];
                    return ListTile(
                      title: Text(
                        'Chương ${chapter.chapterNumber}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFViewerScreen(
                              chapters: viewModel.chapters, // toàn bộ danh sách chương
                              currentIndex: index,          // chương hiện tại đang chọn
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}