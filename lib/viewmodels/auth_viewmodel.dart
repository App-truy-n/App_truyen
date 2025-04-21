// lib/viewmodels/auth_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/database_helper.dart';

class AuthViewModel with ChangeNotifier {
  User? _currentUser;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _errorMessage = null;
    notifyListeners();

    final user = await DatabaseHelper.instance.getUserByEmail(email);
    if (user == null) {
      _errorMessage = 'Email không tồn tại';
      notifyListeners();
      return false;
    }

    if (user.password != password) {
      _errorMessage = 'Mật khẩu không đúng';
      notifyListeners();
      return false;
    }

    _currentUser = user;
    notifyListeners();
    return true;
  }

  Future<bool> register(String email, String password) async {
    _errorMessage = null;
    notifyListeners();

    final existingUser = await DatabaseHelper.instance.getUserByEmail(email);
    if (existingUser != null) {
      _errorMessage = 'Email đã tồn tại';
      notifyListeners();
      return false;
    }

    final user = User(id: 0, email: email, password: password);
    print(">>> Đăng ký: ${user.toMap()}");

    try {
      await DatabaseHelper.instance.insertUser(user);

      // Kiểm tra sau khi thêm
      final insertedUser = await DatabaseHelper.instance.getUserByEmail(email);
      print(">>> User từ DB sau khi insert: ${insertedUser?.toMap()}");

      _currentUser = await DatabaseHelper.instance.getUserByEmail(email);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Đăng ký thất bại: $e';
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    _errorMessage = null;
    notifyListeners();
  }
}