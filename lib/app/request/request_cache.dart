
import 'dart:convert';

import 'package:first_flutter/app/app.dart';
import 'package:sqflite/sqflite.dart';

class RequestCache {
  static RequestCache _instance;

  static RequestCache get instance {
    if (_instance == null) {
      _instance = RequestCache();
    }
    return _instance;
  }

  Future onUpgrade(Database db, int oldVersion, int newVersion) async {
    await _createTables(db);
  }

  _createTables(Database db) async {
    await db.execute('''
      create table if not exists request_cache (
        url text primary key,
        response text,
        expire_date)
    ''');
  }

  cleanData() async {
    var deletedCount = await database.rawDelete('delete from request_cache');
    print('request cache: 删除$deletedCount 条记录');
  }

  save(String url, dynamic response, int cacheSeconds) async {
    var data = json.encode(response);
    var expireDate = DateTime.now().millisecondsSinceEpoch + cacheSeconds * 1000;
    await database.rawInsert('replace into request_cache (url, response, expire_date) values (?, ?, ?)', [url, data, expireDate]);
  }

  load(String url) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    List<Map> result = await database.rawQuery('select response from request_cache where url = ? and expire_date > ?',[url, now]);
    if (result.isNotEmpty) {
      var response = result.first['response'];
      return json.decode(response);
    } else {
      return null;
    }
  }

  getUrl(String path, Map queryParams) {
    String url;
    if (queryParams == null || queryParams.isEmpty) {
      url = path;
    } else {
      url = path + '?';
      queryParams.keys.forEach((key) {
        var value = queryParams[key];
        url += '$key=$value&';
      });
      url = url.substring(0, url.length-1);
    }
    return url;
  }

}