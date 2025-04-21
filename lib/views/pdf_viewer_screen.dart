import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import '../models/chapter.dart';
import '../viewmodels/pdf_viewer_viewmodel.dart';

class PDFViewerScreen extends StatefulWidget {
  final List<Chapter> chapters;
  final int currentIndex;

  const PDFViewerScreen({
    Key? key,
    required this.chapters,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late int currentIndex;
  Key pdfViewKey = UniqueKey(); // Key để rebuild PDFView

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadChapter();
    });
  }

  void _loadChapter() {
    final chapter = widget.chapters[currentIndex];

    // Đổi key để buộc PDFView rebuild
    setState(() {
      pdfViewKey = UniqueKey();
    });

    Provider.of<PDFViewerViewModel>(context, listen: false)
        .loadChapter(chapter.chapterPath, 'Chương ${chapter.chapterNumber}');
  }

  void _goToPreviousChapter() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _loadChapter();
    }
  }

  void _goToNextChapter() {
    if (currentIndex < widget.chapters.length - 1) {
      setState(() {
        currentIndex++;
      });
      _loadChapter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PDFViewerViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: currentIndex > 0 ? _goToPreviousChapter : null,
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    viewModel.chapterTitle ?? 'Chương',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: currentIndex < widget.chapters.length - 1
                      ? _goToNextChapter
                      : null,
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: viewModel.chapterPath != null
              ? PDFView(
            key: pdfViewKey, // Gán key vào PDFView
            filePath: viewModel.chapterPath!,
            onError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Không thể mở file PDF: $error')),
              );
            },
          )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
