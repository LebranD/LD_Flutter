import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter/tab_page.dart';

void main() {

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dog shit'), 
      ),
      body: Text('${details.exception}'),
    );
  };

  runZoned<void>(
    () => runApp(MaterialApp(title: 'welcom to LebranD', home: TabPage())),
    zoneSpecification: ZoneSpecification(print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(zone, line);
    }),
  );
} 