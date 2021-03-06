import 'dart:async';

import 'package:first_flutter/app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        title: Text('oh shit'), 
      ),
      body: Text('${details.exception}'),
    );
  };

  runZoned<void>(
    () => runApp(AppPage()),
    zoneSpecification: ZoneSpecification(print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(zone, line);
    }),
  );
} 