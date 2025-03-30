import 'package:flutter/material.dart';
import 'StoryListPage.dart';
import 'FollowingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Trang chủ mặc định

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // Nội dung chính
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Khoảng cách từ trên xuống

              // Thanh menu trên cùng
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Danh sách truyện", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("BXH Hot", style: TextStyle(fontSize: 16)),
                    Text("Yêu thích", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Tiêu đề "Đề xuất"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Đề xuất",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),

              const SizedBox(height: 20),

              // Card truyện đề xuất
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 400,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/jujutsu-kaisen-season-3.jpg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 50,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),

                    // Nút yêu thích
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.red),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Các nút điều hướng (Thể loại truyện, Đang theo dõi)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryButton(Icons.book, "Thể loại truyện", StoryListPage()), // Chuyển sang danh sách truyện
                    _buildCategoryButton(Icons.search, "Đang theo dõi", FollowingPage()), // Chuyển sang đang theo dõi
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      // BottomNavigationBar với logic chọn tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black, // Màu icon được chọn
        unselectedItemColor: Colors.black54, // Màu icon chưa chọn
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, size: 30), // Icon sách (Khám phá)
            label: "Khám phá",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // Icon nhà (Trang chủ)
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), // Icon người (Tôi)
            label: "Tôi",
          ),
        ],
      ),
    );
  }

  //  Nút thể loại truyện và Đang theo dõi có thể bấm để chuyển trang
  Widget _buildCategoryButton(IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}