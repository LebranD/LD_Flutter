
import 'package:flutter/cupertino.dart';

class AppInfo {
  AppInfo({
    @required this.appName,
    @required this.packageType,
    this.defaultNickName = '云客',
  });

  final String appName;
  final int packageType;
  final String defaultNickName;
}