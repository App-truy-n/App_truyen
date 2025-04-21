// lib/models/user.dart
class User {
  final int id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) 'id': id,  // Chỉ thêm id nếu khác 0
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}