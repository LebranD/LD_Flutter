
import 'dart:io';

import 'package:first_flutter/app/app.dart';
import 'package:first_flutter/module/info/region.dart';
import 'package:quiver/strings.dart';

class AppManager {
  AppManager._();
  static AppManager _instance;
  static AppManager get instance {
    if (instance == null) {
      _instance = AppManager._();
    }
    return _instance;
  }

  String get channelId {
    return preferences.getString('channelId');
  }

  set channelId(String channel) {
    preferences.setString('channelId', channel);
  }

  String get uuid {
    return preferences.getString('uuid');
  }

  String get idfa {
    return preferences.getString('idfa');
  }

  set idfa(String idfa) {
    preferences.setString('idfa', idfa);
  }

  String get imei {
    return preferences.getString('imei');
  }

  set imei(String imei) {
    preferences.setString('imei', imei);
  }

  String get aaid {
    return preferences.getString('aaid');
  }

  set aaid(String aaid) {
     preferences.setString('aaid', aaid);
  }

  String get mac {
    return preferences.getString('mac');
  }

  set mac(String mac) {
    preferences.setString('mac', mac);
  }

  Future createUuid() async {
    var uuid = preferences.getString('uuid');
    if (uuid == null) {

    }
  }

  String get zaid {
    var zaid;
    if (Platform.isAndroid) {
      zaid = flavor.region == Region.cn ? imei : androidDeviceInfo.androidId;
    } else if (Platform.isIOS) {
      if (idfa != '00000000-0000-0000-0000-000000000000') {
        zaid = idfa;
      }
    }
    return isNotEmpty(zaid) ? zaid : uuid;
  }
}