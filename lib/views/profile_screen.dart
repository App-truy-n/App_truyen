// lib/views/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
          ),

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Thêm CircleAvatar để hiển thị ảnh đại diện nếu cần
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/AVT.jpg'),
                  ),
                  SizedBox(height: 70),
                  Card(
                    elevation: 5,
                    color: Colors.white.withOpacity(0.8),
                    child: ListTile(
                      title: Text('Email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
                      subtitle: Text(viewModel.userEmail ?? 'Chưa đăng nhập'),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Đăng xuất', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                    ),
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