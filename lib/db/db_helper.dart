import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detaild/model/model_table.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'vehicle_details';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint("DB not null");
      return;
    }
    try {
      String path = '${await getDatabasesPath()}vehicle_detail.db';
      debugPrint(" in db path");
      _db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        debugPrint("creating new database");
        return db.execute('CREATE TABLE $_tableName ('
            'vehicleType TEXT, brandType TEXT ,'
            'fuelType TEXT,vehicleNo TEXT)');
      });
      debugPrint("DB created");
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(model_table? data) async {
    print("insert function called");
    try {
      return await _db!.insert(_tableName, data!.toJson());
    } catch (e) {
      print(e);
      return 9000;
    }
  }

  static Future<int> delete(model_table data) async {
    print("delete function called");
    return await _db!.delete(_tableName,
        where: 'vehicleNo = ?',
      //whereArgs: [data._vehicleNo];
    );
  }

  static Future<int> deleteAll() async {
    print('delete all');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('Query Called!!!!!!!!!!!!!!!!!!!');
    return await _db!.query(_tableName);
  }
}
