import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SofthreeDbContext {
  static final _databaseName = 'SofthreeOrderDb.db';
  static final _databaseVersion = 1;

  static final SofthreeDbContext instance =
      SofthreeDbContext._privateConstructor();

  static Database? _database;

  SofthreeDbContext._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE salesorders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      customerName TEXT,
      productName TEXT,
      quantity INTEGER,
      price REAL
    )
  ''');
  }
}
