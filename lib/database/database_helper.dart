import 'package:feedback_form/database/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, email TEXT, password TEXT, cnic TEXT, department TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateUser(User user) async {
    final db = await database;
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<Map<String, dynamic>?> getUserData(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        email: maps[i]['email'],
        password: maps[i]['password'],
        cnic: maps[i]['cnic'],
        department: maps[i]['department'],
      );
    });
  }

  Future<void> deleteAllUsers() async {
    final db = await database;
    await db.delete('users'); // Deletes all user records
  }
}
