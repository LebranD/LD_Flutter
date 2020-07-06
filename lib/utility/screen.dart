import 'package:flutter/material.dart';
import 'dart:ui' as ui show window; //这句话的意思是只导入ui库的window模块
//import 'dart:ui' as ui hide window; //导入ui库除了window

class Screen {
  static double get width {
    MediaQueryData mediaData = MediaQueryData.fromWindow(ui.window);
    return mediaData.size.width;
  }

  static double get height {
    MediaQueryData mediaData = MediaQueryData.fromWindow(ui.window);
    return mediaData.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }
}