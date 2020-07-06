import 'package:first_flutter/lifecycle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static Future<T> push<T extends Object>(BuildContext context, Widget page) async {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        settings: RouteSettings(name: '${page.runtimeType}'),
        builder: (BuildContext context) => LifecycleWidget(
          child: page
        ),
      )
    );
  }
}