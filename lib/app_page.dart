
import 'package:flutter/material.dart';
import 'package:first_flutter/tab_page.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TabPage(),
    );
  }
}