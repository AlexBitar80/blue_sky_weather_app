import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'cities.db'), // Mudando o nome do banco de dados
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cities (cityName TEXT PRIMARY KEY)', // Mudando a estrutura da tabela
        );
      },
      version: 1,
    );
  }

  static Future<void> removeCity(String cityName) async {
    final db = await DbUtil.database();
    await db.delete(
      'cities',
      where: 'cityName = ?',
      whereArgs: [cityName],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }

  static Future<void> insertCity(String cityName) async {
    await DbUtil.insert('cities', {'cityName': cityName});
  }

  static Future<List<String>> getCities() async {
    final data = await DbUtil.getData('cities');
    return data.map((city) => city['cityName'] as String).toList();
  }
}
