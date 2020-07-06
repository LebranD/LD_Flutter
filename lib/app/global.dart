

import 'package:device_info/device_info.dart';
import 'package:first_flutter/manager/user_manager.dart';
import 'package:first_flutter/model/user.dart';
import 'package:first_flutter/module/flavor.dart';
import 'package:package_info/package_info.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

int patchId = 0;

IosDeviceInfo iosDeviceInfo;

AndroidDeviceInfo androidDeviceInfo;

Database database;

SharedPreferences preferences;

PackageInfo packageInfo;

Flavor flavor;

User get currentUser => UserManager.instance.user;

String locale;