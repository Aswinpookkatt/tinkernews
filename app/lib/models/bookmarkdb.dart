import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class BookmarkHelper{
  static final _dbName = 'bookmarkDatabase.db';
  static final _dbVersion = 1;
  static final tableName = 'BookmarkTable';
  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnDate = 'date';
  static final columnImg = 'image';
  static final columnContent = 'content';
  static final columnPressed = 'pressed';
  //making it a singleton class
  BookmarkHelper._privateConstructor();
  static final BookmarkHelper instance = BookmarkHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{

    if(_database!=null)return _database;

    _database = await _initiateDatabase();
    return _database;
  }
  _initiateDatabase() async{
    Directory directory  = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version){

    db.execute(
      ''' 
      CREATE TABLE $tableName ( 
      $columnId INTEGER PRIMARY KEY,
      $columnTitle TEXT NOT NULL,
      $columnDate TEXT NOT NULL,
      $columnImg TEXT,
      $columnContent TEXT,
      $columnPressed TEXT)
      '''
    );

  }

  Future<int> insert(Map<String,dynamic> row) async{

    Database db = await instance.database;
    return await db.insert(tableName, row);
  }
  Future <List<Map<String,dynamic>>> queryAll() async{
      Database db = await instance.database;
      return await db.query(tableName);
   }
   Future<int> update(Map<String,dynamic> row) async{
     Database db = await instance.database;
     int id = row[columnId];
     return await db.update(tableName, row,where: '$columnId = ? $columnTitle = ?',whereArgs:[id]);

   }

   Future delete(int id) async{
     Database db = await instance.database;
     return await db.delete(tableName,where: '$columnId = ? ', whereArgs: [id]);

   }
}
