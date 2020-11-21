import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'control.db'),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE switch(id INTEGER  PRIMARY KEY NOT NULL, name TEXT NOT NULL, group TEXT NOT NULL)');
      },
      version: 1,
    );
  }

  Future<dynamic> newName({String newName, String groups}) async {
    final db = await database;
    var res = await db.rawInsert(
        'INSERT INTO switch(name,group) VALUES (?,?)', ["$newName", "$groups"]);

    return res;
  }

  Future<dynamic> DeleteName(identity) async {
    final db = await database;
    var res =
        await db.rawDelete('DELETE FROM switch WHERE name = ?', ['$identity']);

    return res;
  }

  Future<dynamic> getName() async {
    final db = await database;
    var res = await db.query('switch');
    if (res.length == 0) {
      return null;
    } else {
      res.forEach((row) => print(row));
      return res;
    }
  }

  Future deleteDatabse() async {
    String path = join(await getDatabasesPath(), 'control.db');
    await deleteDatabase(path);
  }
}
