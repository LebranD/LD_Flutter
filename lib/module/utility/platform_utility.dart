

// 抽象类不能实例化
import 'dart:io';

import 'package:first_flutter/app/app.dart';

PlatformUtility platformUtility = Platform.isIOS ? PlatformUtilityIOS() : PlatformUtilityAndroid();

abstract class PlatformUtility {
  // 抽象方法 必须实现
  String get platformName;
  bool get isPhysicalDevice;
}

class PlatformUtilityIOS extends PlatformUtility {
  @override
  String get platformName => 'iOS';
  @override
  bool get isPhysicalDevice => iosDeviceInfo.isPhysicalDevice;
}

class PlatformUtilityAndroid extends PlatformUtility {
  @override
  String get platformName => 'android';
  @override
  bool get isPhysicalDevice => androidDeviceInfo.isPhysicalDevice;
}