import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Đăng nhập',
              style: TextStyle(fontSize: 25, color: Colors.black,  shadows: [Shadow(color: Colors.black, blurRadius: 2)]),
            ),
            backgroundColor: Colors.indigo,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loli.jpg'), // Ảnh từ thư mục assets
                fit: BoxFit.cover, // Phủ kín nền
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Lớp phủ để nội dung dễ đọc
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      filled: true, // Thêm nền cho TextField
                      fillColor: Colors.white.withOpacity(0.9), // Màu nền trắng mờ
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(),
                      filled: true, // Thêm nền cho TextField
                      fillColor: Colors.white.withOpacity(0.9), // Màu nền trắng mờ
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  if (viewModel.errorMessage != null)
                    Text(
                      viewModel.errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)], // Thêm bóng chữ
                      ),
                    ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final success = await viewModel.login(
                        _emailController.text,
                        _passwordController.text,
                      );
                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: Text('Đăng nhập'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Màu nút
                      foregroundColor: Colors.black, // Màu chữ trên nút
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Chưa có tài khoản? Đăng ký',
                      style: TextStyle(
                        color: Colors.black, // Đổi màu chữ
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)], // Thêm bóng chữ
                      ),
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