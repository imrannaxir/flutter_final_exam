import 'package:flutter_final_exam/softhree-db/softhree_db_context.dart';

abstract class BaseRepository<T> {
  String get tableName;

  T fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap(T item);

  Future<int> insert(T item) async {
    final db = await SofthreeDbContext.instance.database;
    return db.insert(tableName, toMap(item));
  }

  Future<List<T>> getAll() async {
    final db = await SofthreeDbContext.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) => fromMap(maps[i]));
  }

  Future<int> update(T item, int id) async {
    final db = await SofthreeDbContext.instance.database;
    return db.update(
      tableName,
      toMap(item),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await SofthreeDbContext.instance.database;
    return db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
