import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/comic.dart';
import '../models/chapter.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('comics.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE comics (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            thumbnailPath TEXT NOT NULL,
            category TEXT NOT NULL,
            isFavorite INTEGER NOT NULL DEFAULT 0
          )
        ''');

        await db.execute('''
          CREATE TABLE chapters (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            comicId INTEGER NOT NULL,
            chapterNumber INTEGER NOT NULL,
            chapterPath TEXT NOT NULL,
            FOREIGN KEY (comicId) REFERENCES comics(id)
          )
        ''');
      },
    );
  }

  // Thêm method xóa toàn bộ dữ liệu
  Future<void> deleteAllData() async {
    final db = await database;
    await db.delete('chapters');
    await db.delete('comics');
    await db.delete('users');
    await db.execute('DELETE FROM sqlite_sequence');
  }

  // Quản lý người dùng
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final result = await db.query('users');
    return result.map((e) => User.fromMap(e)).toList();
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await database;
    final maps = await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (maps.isNotEmpty) return User.fromMap(maps.first);
    return null;
  }

  // Quản lý truyện
  Future<int> insertComic(Comic comic) async {
    final db = await database;
    return await db.insert('comics', comic.toMap());
  }

  Future<List<Comic>> getComics() async {
    final db = await database;
    final maps = await db.query('comics');
    return List.generate(maps.length, (i) => Comic.fromMap(maps[i]));
  }

  Future<List<Comic>> getFavoriteComics() async {
    final db = await database;
    final maps = await db.query('comics', where: 'isFavorite = ?', whereArgs: [1]);
    return List.generate(maps.length, (i) => Comic.fromMap(maps[i]));
  }

  Future<List<Comic>> searchComics(String query) async {
    final db = await database;
    final maps = await db.query('comics', where: 'title LIKE ?', whereArgs: ['%$query%']);
    return List.generate(maps.length, (i) => Comic.fromMap(maps[i]));
  }

  Future<void> toggleFavorite(int comicId, bool isFavorite) async {
    final db = await database;
    await db.update('comics', {'isFavorite': isFavorite ? 1 : 0}, where: 'id = ?', whereArgs: [comicId]);
  }

  // Quản lý chương
  Future<int> insertChapter(Chapter chapter) async {
    final db = await database;
    return await db.insert('chapters', chapter.toMap());
  }

  Future<List<Chapter>> getChapters(int comicId) async {
    final db = await database;
    final maps = await db.query('chapters', where: 'comicId = ?', whereArgs: [comicId]);
    return List.generate(maps.length, (i) => Chapter.fromMap(maps[i]));
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}