

import 'package:first_flutter/app/app.dart';
import 'package:package_info/package_info.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppModel extends Model{

  Future setup() async {
    preferences = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
    await setupDataBase();
  }

  Future setupDataBase() async {
    var databasePath = await getDatabasesPath();
    String path = databasePath + '/fnovel.db';
    print('path ===== $path');
    database = await openDatabase(path, version: 1, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      await RequestCache.instance.onUpgrade(db, oldVersion, newVersion);
    });
  }
}