import 'package:flutter/material.dart';

class StoryListPage extends StatelessWidget {
  const StoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách truyện"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Ảnh nền
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/be-rong-loli.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Nội dung danh sách thể loại truyện
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2, // Hiển thị 2 cột
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3, // Điều chỉnh kích thước của button
                    children: [
                      _buildGenreButton("Toàn bộ"),
                      _buildGenreButton("Manhwa"),
                      _buildGenreButton("Manhua"),
                      _buildGenreButton("Manga"),
                      _buildGenreButton("Kinh dị"),
                      _buildGenreButton("Fantasy"),
                      _buildGenreButton("Xuyên không"),
                      _buildGenreButton("School Life"),
                      _buildGenreButton("Harem"),
                      _buildGenreButton("Ecchi"),
                      _buildGenreButton("Ngôn tình"),
                      _buildGenreButton("Drama"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Thanh điều hướng dưới cùng
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Khám phá",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tôi",
          ),
        ],
      ),
    );
  }

  // Hàm tạo button thể loại truyện
  Widget _buildGenreButton(String title) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}