import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  static const String ID = 'id';
  static const String NAME = 'name';
  static const String GROUP = 'groupNames';
  static const String TABLE = 'class';
  static const String DB_NAME = 'control.db';

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      print('complete');
      return _database;
    }
  }

  Future initDB() async {
    // final path = await databasePath('control.db');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '$DB_NAME';

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //creates the database table
  Future _onCreate(Database db, int version) async {
    try {
      await db.execute('''
          CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY, $NAME TEXT NOT NULL, $GROUP TEXT NOT NULL)
          ''');
    } catch (e) {
      print('create data error: $e');
    }
    print('correct');
  }

  //this function enables you to add values to your database

  Future<dynamic> CreateNewName({String newName, String groups}) async {
    var res;
    final db = await database;
    try {
      res = await db.rawInsert(
          'INSERT INTO $TABLE($NAME , $GROUP) VALUES (?,?)',
          ['$newName', '$groups']);
    } catch (e) {
      print('throw it: $e');
    }
    return res;
  }

  //it helps you to delete data from datebase

  Future<dynamic> DeleteName(identity) async {
    var res;
    final db = await database;
    try {
      res = await db
          .rawDelete('DELETE FROM $TABLE WHERE $NAME = (?)', ['$identity']);
    } catch (e) {
      print('Delete error: $e');
    }
    return res;
  }

  //it helps you to get names from the datebase

  Future<dynamic> getName() async {
    final db = await database;
    try {
      var res = await db.query('$TABLE');
      if (res.length == 0) {
        return null;
      } else {
        res.forEach((row) => print(row));
        return res;
      }
    } catch (e) {
      print('getName error: $e');
    }
  }
}
