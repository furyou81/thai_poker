import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import './models/player.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "thaiPokerDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(
      'CREATE TABLE Player (id INTEGER PRIMARY KEY, username TEXT)');
    });
  }

  // newPlayer(Player newPlayer) async {
  //   final db = await database;
  //   var res = await db.rawInsert(
  //     "INSERT Into Player (id,username)"
  //     " VALUES (${newPlayer.id},${newPlayer.username})");
  //   return res;
  // }

  newPlayer(String username) async {
    final db = await database;
    var res = await db.rawInsert(
      'INSERT INTO Player (id, username) VALUES (NULL, ?)', [username]);
    print(res);
    return res;
  }

  doesPlayerExists(String username) async {
    final db = await database;
    var res = await db.rawQuery("SELECT id FROM Player WHERE username = ?", [username]);
    print(res);
    print(res.length);
    return res.length > 0;
  }

  getPlayers() async {
    final db = await database;
    var res = await db.rawQuery("SELECT username from Player");
    print(res);
    return res;
  }
}