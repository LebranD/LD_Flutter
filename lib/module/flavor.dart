
import 'package:first_flutter/module/info/app_info.dart';
import 'package:first_flutter/module/info/region.dart';
import 'package:flutter/cupertino.dart';

class Flavor {
  Flavor({
    @required this.name,
    @required this.app,
    this.region = Region.cn,
  });

  final String name;
  final AppInfo app;
  final String region;
}